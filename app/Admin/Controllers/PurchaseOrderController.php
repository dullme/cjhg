<?php

namespace App\Admin\Controllers;

use App\Models\Item;
use App\Models\Origin;
use App\Models\PurchaseOrder;
use App\Models\Supplier;
use App\Models\Warehouse;
use Carbon\Carbon;
use Encore\Admin\Admin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Box;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Validator;

class PurchaseOrderController extends ResponseController
{

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'PurchaseOrder';

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
            ->row('<purchase-order></purchase-order>');
    }

    public function show($id, Content $content)
    {
        $purchaseOrders = PurchaseOrder::with(['supplier', 'warehouses' => function ($query) {
            $query->with('item.origin', 'solds.customerOrder');
        }])->find($id);


//        dd($purchaseOrders->toArray());

        return $content
            ->title($this->title())
            ->description($this->description['show'] ?? trans('admin.show'))
            ->body(view('admin/purchase_order', compact('purchaseOrders')));
    }

    public function save(Request $request)
    {
        $validator = Validator::make(request()->all(), [
            'supplier_id' => 'required',
            'order_time'  => 'required|date:Y-m-d',
        ]);

        if ($validator->fails()) {
            return $this->setStatusCode(422)->responseError($validator->errors()->first());
        }

        $items = request()->input('items');
        $items = collect($items)->where('deleted', false)->where('item_id', '!=', null);

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
            $po_no = PurchaseOrder::orderBy('id', 'DESC')->first();
            $number = 100001;
            if ($po_no) {
                $number = $po_no->last_number + 1;
            }

            $purchaseOrder = PurchaseOrder::create([
                'no'          => 'PO' . sprintf("%06d", $number),
                'last_number' => $number,
                'supplier_id' => request()->input('supplier_id'),
                'order_time'  => request()->input('order_time'),
            ]);

            $items = $items->map(function ($item) use ($purchaseOrder, $now) {

                return [
                    'purchase_order_id' => $purchaseOrder->id,
                    'item_id'           => $item['item_id'],
                    'quantity'          => $item['quantity'],
                    'unit_price'        => $item['unit_price'],
                    'total'             => bigNumber($item['unit_price'])->multiply($item['quantity'])->getValue(),
                    'sold'              => 0,
                    'for_sale'          => $item['quantity'],
                    'remark'            => $item['remark'],
                    'created_at'        => $now,
                    'updated_at'        => $now,
                ];
            });

            Warehouse::insert($items->toArray());

            DB::commit();   //??????

            return $this->responseSuccess('????????????');

        } catch (\Exception $exception) {
            DB::rollBack(); //??????

            return $this->setStatusCode(422)->responseError($exception->getMessage());
        }
    }


    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PurchaseOrder());
        $grid->model()->orderBy('id', 'desc');
        $grid->filter(function($filter){

            // ???????????????id?????????
            $filter->disableIdFilter();

            // ??????????????????????????????
            $filter->equal('supplier_id', '?????????')->select(Supplier::pluck('name', 'id'));

            $filter->between('order_time', '????????????')->date();

        });


        $grid->header(function ($query) {
            $current_total_price = $query->get()->map(function ($item){
                $item['total_price'] = $item->warehouses->sum('total');
                return $item;
            })->sum('total_price');

            $purchase = PurchaseOrder::with('warehouses')->get();

            $purchase = $purchase->map(function ($item){
                $order_time= Carbon::parse($item->order_time);
                $item['year'] = $order_time->year;
                $item['month'] = $order_time->month;
                $item['order_total'] = $item->warehouses->sum('total');

                return $item;
            });

            $purchase = $purchase->groupBy('year');
            $years = $purchase->keys()->toArray();

            $data = [];
            $res = [];
            foreach ($years as $year){
                $months = $purchase[$year]->groupBy('month')->map(function ($item){
                    return $item->sum('order_total');
                })->toArray();

                $total_year = collect($months)->sum();
                for($i=0;$i<12;$i++){
                    $data[$year][$i] = isset($months[$i+1]) ? $months[$i+1] : 0;
                }

                $res[] = [
                    'label' => $year,
                    'total_year' => $total_year,
                    'data' => $data[$year],
                ];

            }

            return new Box('Bar chart', view('admin.chart.purchase', compact('res', 'current_total_price')));
        });

//        $grid->column('id', __('Id'));
        $grid->column('no', __('????????????'))->display(function ($no) {
            $url = url('/admin/purchase-orders/' . $this->id);

            return "<a href='{$url}'>{$no}</a>";
        });
        $grid->supplier()->name(__('?????????'));
        $grid->warehouses(__('?????????'))->display(function ($warehouses){
            return '??'.$this->warehouses->sum('total');
        });
        $grid->column('order_time', __('????????????'))->display(function ($order_time) {
            return substr($order_time, 0, 10);
        });
        $grid->column('created_at', __('????????????'));

//        $grid->column('updated_at', __('????????????'));

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
        $show = new Show(PurchaseOrder::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('no', __('????????????'));
        $show->field('supplier_id', __('?????????'));
        $show->field('order_time', __('????????????'));
        $show->field('created_at', __('????????????'));
        $show->field('updated_at', __('????????????'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PurchaseOrder());

        $form->hidden('no', __('No'));
        $form->hidden('last_number', __('Last Number'));
        $form->select('supplier_id', __('?????????'))->options(Supplier::pluck('name', 'id'));
        $form->date('order_time', __('????????????'))->default(date('Y-m-d'));


        $form->saving(function (Form $form) {
            if($form->isCreating()){
                $po_no = PurchaseOrder::orderBy('id', 'DESC')->first();
                $number = 100001;
                if ($po_no) {
                    $number = $po_no->last_number + 1;
                }
                $form->last_number = $number;
                $form->no = 'PO' . sprintf("%06d", $number);
            }
        });

        return $form;
    }
}
