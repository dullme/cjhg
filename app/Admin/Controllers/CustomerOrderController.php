<?php

namespace App\Admin\Controllers;

use App\Models\Customer;
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
            return $this->setStatusCode(422)->responseError('????????????????????????0');
        }

        if ($items->where('unit_price', '<=', 0)->count()) {
            return $this->setStatusCode(422)->responseError('????????????????????????0');
        }

        if ($items->count() < 1) {
            return $this->setStatusCode(422)->responseError('??????????????????');
        }

        DB::beginTransaction(); //????????????
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
                'amount'      => $amount,//?????????,
                'invoice'     => $amount,//???????????????,
                'invoiced'    => 0,//???????????????,
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
                    $total_count = (integer) $item['quantity']; //????????????????????????
                    foreach ($warehouses as $warehouse) {
                        if ($total_count > 0) { //??????????????????????????????0

                            if ($warehouse->for_sale > $total_count) {
                                Warehouse::where('id', $warehouse->id)->update([
                                    'sold'     => $warehouse->sold + $total_count,
                                    'for_sale' => $warehouse->for_sale - $total_count,
                                ]);
                                $sold_data = [
                                    'item_id'           => $item['item_id'],
                                    'warehouse_id'      => $warehouse->id,
                                    'customer_order_id' => $customerOrder->id,
                                    'sales_price'       => $item['unit_price'],//????????????
                                    'purchase_price'    => $warehouse->unit_price,//????????????
                                    'quantity'          => $total_count,//??????
                                    'sales_total'       => bigNumber($item['unit_price'])->multiply($total_count)->getValue(),//????????????
                                    'purchase_total'    => bigNumber($warehouse->unit_price)->multiply($total_count)->getValue(),//????????????
                                ];
                                Sold::create($sold_data);
                                $data[] = $sold_data;
                                break;
                            } else { //???????????????????????????????????????
                                $need_cut = $warehouse->for_sale;
                                Warehouse::where('id', $warehouse->id)->update([
                                    'sold'     => $warehouse->quantity,
                                    'for_sale' => 0,
                                ]);

                                $sold_data = [
                                    'item_id'           => $item['item_id'],
                                    'warehouse_id'      => $warehouse->id,
                                    'customer_order_id' => $customerOrder->id,
                                    'sales_price'       => $item['unit_price'],//????????????
                                    'purchase_price'    => $warehouse->unit_price,//????????????
                                    'quantity'          => $need_cut,//??????
                                    'sales_total'       => bigNumber($item['unit_price'])->multiply($need_cut)->getValue(),//????????????
                                    'purchase_total'    => bigNumber($warehouse->unit_price)->multiply($need_cut)->getValue(),//????????????
                                ];
                                Sold::create($sold_data);
                                $data[] = $sold_data;
                                $total_count = $total_count - $need_cut;
                            }
                        } else {
                            break; //??????????????????????????????0??????????????????
                        }
                    }

                } else {
                    throw new \Exception('?????????????????????');
                }
                $order_info = $item;
                $order_info['customer_order_id'] = $customerOrder->id;
                OrderInfo::create($order_info);

                return $data;
            });

            DB::commit();   //??????

            return $this->responseSuccess('????????????');

        } catch (\Exception $exception) {
            DB::rollBack(); //??????

            return $this->setStatusCode(422)->responseError($exception->getMessage());
        }
    }

    public function getCanSalesItems()
    {
        $warehouse = Warehouse::with('item.origin')->where('for_sale', '>', 0)->get();
        $warehouse = $warehouse->map(function ($item) {
            return [
                'id'       => $item->item->id,
                'for_sale' => $item->for_sale,
                'name'     => $item->item->name,
                'weight'   => $item->item->weight,
                'unit'     => $item->item->unit,
                'origin'     => $item->item->origin->name
            ];
        })->groupBy('id');
        $warehouse = $warehouse->map(function ($item) {

            return [
                'id'       => $item[0]['id'],
                'name'     => $item[0]['name'],
                'weight'   => $item[0]['weight'],
                'unit'     => $item[0]['unit'],
                'origin'     => $item[0]['origin'],
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

        $grid->filter(function($filter){

            // ???????????????id?????????
            $filter->disableIdFilter();

            // ??????????????????????????????
            $filter->equal('customer_id', '??????')->select(Customer::pluck('name', 'id'));

            $filter->between('order_time', '????????????')->date();

        });

//        $grid->column('id', __('Id'));
        $grid->column('no', __('????????????'))->display(function ($no) {
            $url = url('/admin/customer-orders/' . $this->id);

            return "<a href='{$url}'>{$no}</a>";
        });
//        $grid->column('last_number', __('Last number'));
        $grid->customer()->name('??????');
        $grid->column('commission', __('??????'))->display(function ($commission) {
            return $commission == 0 ? '-' : $commission;
        })->totalRow(function ($item){
            return '?? '.$item;
        })->prefix('??')->sortable();
        $grid->column('freight', __('?????????'))->display(function ($freight) {
            return $freight;
        })->totalRow(function ($item){
            return '?? '.$item;
        })->prefix('??')->sortable();


        $grid->column('pick_up', __('????????????'))->display(function ($pick_up) {
            return $pick_up;
        })->totalRow(function ($item){
            return '?? '.$item;
        })->prefix('??')->sortable();

        $grid->column('transportation', __('????????????'))->display(function ($transportation) {
            return $transportation;
        })->totalRow(function ($item){
            return '?? '.$item;
        })->prefix('??')->sortable();

        $grid->column('deliver_goods', __('????????????'))->display(function ($deliver_goods) {
            return $deliver_goods;
        })->totalRow(function ($item){
            return '?? '.$item;
        })->prefix('??')->sortable();

        $grid->column('vat', __('??????'))->display(function ($vat) {
            return intval(bigNumber($vat)->multiply(100)->getValue()) . '%';
        });
        $grid->column('amount', __('?????????'))->display(function ($amount) {
            return $amount;
        })->totalRow(function ($item){
            return '?? '.$item;
        })->prefix('??')->sortable();
        $grid->column('invoice', __('????????????'))->display(function ($invoice) {
            if ($invoice > 0) {
                return '<span class="text-red">' . $invoice . '</span>';
            } else if ($invoice == 0) {
                return '-';
            }

            return $invoice;
        })->totalRow(function ($item){
            return '?? '.$item;
        })->prefix('??')->sortable();
        $grid->column('invoiced', __('????????????'))->display(function ($invoiced) {
            if ($invoiced == 0) {
                return '-';
            }

            return $invoiced;
        })->totalRow(function ($item){
            return '?? '.$item;
        })->prefix('??')->sortable();
        $grid->column('logistics', __('????????????'));
        $grid->column('order_time', __('????????????'))->display(function ($order_time) {
            return substr($order_time, 0, 10);
        })->sortable();
        $grid->column('created_at', __('????????????'))->sortable();

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

        $form->display('no', __('????????????'));
        $form->display('customer_id', __('??????'));
        $form->date('order_time', __('????????????'));
        $form->file('files', '??????');

        return $form;
    }

    public function show($id, Content $content)
    {
        $customerOrders = CustomerOrder::with(['customer', 'orderInfoes.item.origin', 'customerInvoiceDetails.customerInvoice', 'solds' => function ($query) {
            $query->with('item', 'warehouse.purchaseOrder');
        }])->find($id);

        $solds = $customerOrders->solds->groupBy('item_id')->map(function ($item) {
            $purchase_total = bigNumber($item->sum('purchase_total'), 5)->getValue(); //??????
            $sales_total = bigNumber($item->sum('sales_total'), 5)->getValue();
            $quantity = $item->sum('quantity');

            return [
                'name'           => $item[0]['item']['name'],
                'weight'         => $item[0]['item']['weight'],
                'unit'           => $item[0]['item']['unit'],
                'origin'           => $item[0]['item']['origin']['name'],
                'sales_price'    => $item[0]['sales_price'],
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
