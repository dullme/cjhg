<?php

namespace App\Admin\Controllers;

use App\Models\CustomerOrder;
use App\Models\OrderInfo;
use App\Models\PurchaseOrder;
use App\Models\Sold;
use App\Models\Warehouse;
use Carbon\Carbon;
use Encore\Admin\Admin;
use DB;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Validator;

class CustomerOrderController extends ResponseController
{

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'CustomerOrder';

    public function create(Content $content)
    {
        Admin::script(<<<EOF
        const app = new Vue({
        el: '#app'
    });
EOF
        );

        return $content
            ->title($this->title())
            ->description($this->description['index'] ?? trans('admin.list'))
            ->row('<customer-order></customer-order>');
    }

    public function getCustomerOrders($id)
    {
        $customerOrders = CustomerOrder::where('customer_id', $id)->where('invoice', '>', 0)->get();
        $customerOrders = $customerOrders->map(function ($item) {
            return [
                'id'         => $item->id,
                'no'         => $item->no,
                'order_time' => substr($item['order_time'], 0, 10),
                'amount'     => $item->amount,
                'invoice'    => $item->invoice,
                'invoiced'   => $item->invoiced
            ];
        });


        return response()->json($customerOrders);
    }

    public function save()
    {
        $validator = Validator::make(request()->all(), [
            'customer_id'    => 'required',
            'order_time'     => 'required|date:Y-m-d',
            'pick_up_date'   => 'nullable|date:Y-m-d',
            'commission'     => 'required|integer|min:0',
            'logistics'      => 'required',
            'pick_up'        => 'nullable|numeric|min:0',
            'transportation' => 'nullable|numeric|min:0',
            'deliver_goods'  => 'nullable|numeric|min:0',
            'items'          => 'required',
            'remarks'        => 'nullable',
        ]);


        if ($validator->fails()) {
            return $this->setStatusCode(422)->responseError($validator->errors()->first());
        }

        $items = request()->input('items');
        $items = collect($items)->where('deleted', false)->where('item_id', '!=', null);
        $items = $items->map(function ($item) {
            return [
                'item_id'    => $item['item_id'],
                'unit_price' => $item['unit_price'],
                'quantity'   => $item['quantity'],
                'content'   => $item['content'],
                'total'      => bigNumber($item['unit_price'])->multiply($item['quantity'])->getValue()
            ];
        })->values();

        if ($items->where('quantity', '<', 1)->count()) {
            return $this->setStatusCode(422)->responseError('产品数量必须大于0');
        }

        if ($items->where('unit_price', '<=', 0)->count()) {
            return $this->setStatusCode(422)->responseError('产品价格必须大于0');
        }

        if ($items->count() < 1) {
            return $this->setStatusCode(422)->responseError('必须添加产品');
        }

        DB::beginTransaction(); //开启事务
        $now = Carbon::now()->toDateTimeString();
        try {
            $so_no = CustomerOrder::orderBy('id', 'DESC')->first();
            $number = 100001;
            if ($so_no) {
                $number = $so_no->last_number + 1;
            }
            $amount = $items->sum('total');
            $customerOrder = CustomerOrder::create([
                'no'          => 'SO' . sprintf("%06d", $number),
                'last_number' => $number,
                'commission'  => request()->input('commission'),
                'vat'         => config('VAT'),
                'amount'      => $amount,//总金额,
                'invoice'     => $amount,//待开票金额,
                'invoiced'    => 0,//已开票金额,
                'freight'     => bigNumber(request()->input('pick_up'))->add(request()->input('transportation'))->add(request()->input('deliver_goods'))->getValue(),
                'logistics'   => request()->input('logistics'),
                'customer_id' => request()->input('customer_id'),
                'order_time'  => request()->input('order_time'),
                'pick_up_date'=> request()->input('pick_up_date'),
                'pick_up'=> request()->input('pick_up'),
                'transportation'=> request()->input('transportation'),
                'deliver_goods'=> request()->input('deliver_goods'),
                'remarks'=> request()->input('remarks'),
            ]);

            $res = $items->map(function ($item) use ($customerOrder) {
                $data = [];
                $warehouses = Warehouse::where('item_id', $item['item_id'])->where('for_sale', '>', 0)->orderBy('id', 'ASC')->get();
                if ($warehouses->sum('for_sale') >= $item['quantity']) {
                    $total_count = (integer) $item['quantity']; //需要扣减的总数量
                    foreach ($warehouses as $warehouse) {
                        if ($total_count > 0) { //如果需要扣减数量大于0

                            if ($warehouse->for_sale > $total_count) {
                                Warehouse::where('id', $warehouse->id)->update([
                                    'sold'     => $warehouse->sold + $total_count,
                                    'for_sale' => $warehouse->for_sale - $total_count,
                                ]);
                                $sold_data = [
                                    'item_id'           => $item['item_id'],
                                    'warehouse_id'      => $warehouse->id,
                                    'customer_order_id' => $customerOrder->id,
                                    'sales_price'       => $item['unit_price'],//销售单价
                                    'purchase_price'    => $warehouse->unit_price,//采购单价
                                    'quantity'          => $total_count,//数量
                                    'sales_total'       => bigNumber($item['unit_price'])->multiply($total_count)->getValue(),//销售总价
                                    'purchase_total'    => bigNumber($warehouse->unit_price)->multiply($total_count)->getValue(),//采购总价
                                ];
                                Sold::create($sold_data);
                                $data[] = $sold_data;
                                break;
                            } else { //不够扣，直接把剩余部分扣完
                                $need_cut = $warehouse->for_sale;
                                Warehouse::where('id', $warehouse->id)->update([
                                    'sold'     => $warehouse->quantity,
                                    'for_sale' => 0,
                                ]);

                                $sold_data = [
                                    'item_id'           => $item['item_id'],
                                    'warehouse_id'      => $warehouse->id,
                                    'customer_order_id' => $customerOrder->id,
                                    'sales_price'       => $item['unit_price'],//销售单价
                                    'purchase_price'    => $warehouse->unit_price,//采购单价
                                    'quantity'          => $need_cut,//数量
                                    'sales_total'       => bigNumber($item['unit_price'])->multiply($need_cut)->getValue(),//销售总价
                                    'purchase_total'    => bigNumber($warehouse->unit_price)->multiply($need_cut)->getValue(),//采购总价
                                ];
                                Sold::create($sold_data);
                                $data[] = $sold_data;
                                $total_count = $total_count - $need_cut;
                            }
                        } else {
                            break; //如果待匹配销售数量为0结束库存扣减
                        }
                    }

                } else {
                    throw new \Exception('当前库存不足！');
                }
                $order_info = $item;
                $order_info['customer_order_id'] = $customerOrder->id;
                OrderInfo::create($order_info);

                return $data;
            });

            DB::commit();   //保存

            return $this->responseSuccess('添加成功');

        } catch (\Exception $exception) {
            DB::rollBack(); //回滚

            return $this->setStatusCode(422)->responseError($exception->getMessage());
        }
    }

    public function getCanSalesItems()
    {
        $warehouse = Warehouse::with('item')->where('for_sale', '>', 0)->get();
        $warehouse = $warehouse->map(function ($item) {
            return [
                'id'       => $item->item->id,
                'for_sale' => $item->for_sale,
                'name'     => $item->item->name,
                'weight'   => $item->item->weight,
                'unit'     => $item->item->unit
            ];
        })->groupBy('id');
        $warehouse = $warehouse->map(function ($item) {
            return [
                'id'       => $item[0]['id'],
                'name'     => $item[0]['name'],
                'weight'   => $item[0]['weight'],
                'unit'     => $item[0]['unit'],
                'for_sale' => collect($item)->sum('for_sale'),
            ];
        })->values();

        return response()->json($warehouse);
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerOrder());
        $grid->model()->orderByDesc('id');

//        $grid->column('id', __('Id'));
        $grid->column('no', __('销售单号'))->display(function ($no) {
            $url = url('/admin/customer-orders/' . $this->id);

            return "<a href='{$url}'>{$no}</a>";
        });
//        $grid->column('last_number', __('Last number'));
        $grid->customer()->name('客户');
        $grid->column('commission', __('佣金'))->display(function ($commission) {
            return $commission == 0 ? '-' : '¥' . $commission;
        });
        $grid->column('freight', __('总运费'))->display(function ($freight) {
            return '¥' . $freight;
        });

        $grid->column('pick_up', __('提货运费'))->display(function ($pick_up) {
            return '¥' . $pick_up;
        });

        $grid->column('transportation', __('运输运费'))->display(function ($transportation) {
            return '¥' . $transportation;
        });

        $grid->column('deliver_goods', __('送货运费'))->display(function ($deliver_goods) {
            return '¥' . $deliver_goods;
        });

        $grid->column('vat', __('税率'))->display(function ($vat) {
            return intval(bigNumber($vat)->multiply(100)->getValue()) . '%';
        });
        $grid->column('amount', __('总金额'))->display(function ($amount) {
            return '¥' . $amount;
        });
        $grid->column('invoice', __('待开发票'))->display(function ($invoice) {
            if ($invoice > 0) {
                return '<span class="text-red">¥' . $invoice . '</span>';
            } else if ($invoice == 0) {
                return '-';
            }

            return '¥' . $invoice;
        });
        $grid->column('invoiced', __('已开发票'))->display(function ($invoiced) {
            if ($invoiced == 0) {
                return '-';
            }

            return '¥' . $invoiced;
        });
        $grid->column('logistics', __('物流公司'));
        $grid->column('order_time', __('下单时间'))->display(function ($order_time) {
            return substr($order_time, 0, 10);
        });
        $grid->column('created_at', __('创建时间'));

//        $grid->column('updated_at', __('Updated at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(CustomerOrder::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('no', __('No'));
        $show->field('last_number', __('Last number'));
        $show->field('customer_id', __('Customer id'));
        $show->field('order_time', __('Order time'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CustomerOrder());

        $form->display('no', __('订单编号'));
        $form->display('customer_id', __('客户'));
        $form->date('order_time', __('下单时间'));
        $form->file('files', '文件');

        return $form;
    }

    public function show($id, Content $content)
    {
        $customerOrders = CustomerOrder::with(['customer', 'orderInfoes.item', 'customerInvoiceDetails.customerInvoice', 'solds' => function ($query) {
            $query->with('item', 'warehouse.purchaseOrder');
        }])->find($id);

        $solds = $customerOrders->solds->groupBy('item_id')->map(function ($item) {
            $purchase_total = bigNumber($item->sum('purchase_total'))->getValue(); //成本
            $sales_total = bigNumber($item->sum('sales_total'))->getValue();
            $quantity = $item->sum('quantity');

            return [
                'name'           => $item[0]['item']['name'],
                'weight'         => $item[0]['item']['weight'],
                'unit'           => $item[0]['item']['unit'],
                'sales_price'    => bigNumber($sales_total)->divide($quantity)->getValue(),
                'quantity'       => $quantity,
                'sales_total'    => $sales_total,
                'purchase_total' => $purchase_total,
                'profit'         => bigNumber($sales_total)->subtract($purchase_total)->getValue(),
                'items'          => $item->toArray(),
            ];
        })->values();

        $customerOrders->offsetUnset('solds');
        $customerOrders->setAttribute('solds', $solds);

        return $content
            ->title($this->title())
            ->description($this->description['show'] ?? trans('admin.show'))
            ->body(view('admin/customer_order', compact('customerOrders')));
    }
}
