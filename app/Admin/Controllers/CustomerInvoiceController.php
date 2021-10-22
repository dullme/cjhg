<?php

namespace App\Admin\Controllers;

use App\Models\Customer;
use App\Models\CustomerInvoice;
use App\Models\CustomerInvoiceDetail;
use App\Models\CustomerOrder;
use Carbon\Carbon;
use Encore\Admin\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Validator;
use DB;

class CustomerInvoiceController extends ResponseController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'CustomerInvoice';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerInvoice());
        $grid->model()->orderByDesc('date');

        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            // 在这里添加字段过滤器
            $filter->equal('customer_id', '客户名称')->select(Customer::pluck('name', 'id'));

        });

//        $grid->column('id', __('Id'));
        $grid->customer()->name('客户名称');
        $grid->column('no', __('发票号'))->display(function ($no){
            $url = url('/admin/customer-invoices/'. $this->id);
            return "<a href='{$url}'>{$no}</a>";
        });
        $grid->column('date', __('开票日期'));
        $grid->column('amount', __('金额'));
        $grid->column('created_at', __('创建时间'));

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
        $show = new Show(CustomerInvoice::findOrFail($id));

        $show->field('customer_id', __('Customer id'));
        $show->field('no', __('发票号'));
        $show->field('date', __('开票日期'));
        $show->field('amount', __('金额'));
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('更新时间'));
        $show->field('images', '发票')->unescape()->as(function ($images) {
            $images = asset('/uploads/'.$images);
            return "<img style='width: 100%' src='{$images}' />";

        });

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CustomerInvoice());

        $form->select('customer_id', __('客户'))->options(Customer::pluck('name', 'id'))->required();
        $form->text('no', __('发票号'))->updateRules(['required', "unique:customer_invoices,no,{{id}}"]);
        $form->date('date', __('开票日期'))->default(date('Y-m-d'))->required();
        $form->currency('amount', __('金额'))->symbol('￥')->required();
        $form->image('images', __('发票'));

        return $form;
    }

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
            ->row('<customer-invoice-order></customer-invoice-order>');
    }

    public function save()
    {
        $validator = Validator::make(request()->all(), [
            'customer_id' => 'required|integer',
            'date'  => 'required|date:Y-m-d',
            'no'  => 'required|string|unique:customer_invoices,no',
            'orders'   => 'required',
            'orders.*.invoice' =>'required|numeric'
        ]);

        if ($validator->fails()) {
            return $this->setStatusCode(422)->responseError($validator->errors()->first());
        }

        $customerOrders = CustomerOrder::where('customer_id', request()->input('customer_id'))->where('invoice', '>', 0)->get();
        $now = Carbon::now()->toDateTimeString();
        DB::beginTransaction(); //开启事务

        try {
            $orders = collect(request()->input('orders'))->where('invoice', '!=', 0);
            $customerInvoice = CustomerInvoice::create([
                'customer_id' => request()->input('customer_id'),
                'no' => request()->input('no'),
                'date' => request()->input('date'),
                'amount' => $orders->sum('invoice')
            ]);

            $orders = $orders->map(function ($item) use($customerOrders, $customerInvoice, $now){
                $orders = $customerOrders->where('id', $item['id'])->first();
                if($item['invoice'] > $orders->invoice){
                    throw new \Exception('开票金额超额');
                }

                $customerOrder = CustomerOrder::find($item['id']);
                $customerOrder->invoice = bigNumber($customerOrder->invoice)->subtract($item['invoice'])->getValue();
                $customerOrder->invoiced = bigNumber($customerOrder->invoiced)->add($item['invoice'])->getValue();
                $customerOrder->save();

                return [
                    'customer_invoice_id' => $customerInvoice->id,
                    'customer_order_id' => $item['id'],
                    'invoice' => $item['invoice'],
                    'created_at' => $now,
                    'updated_at' => $now,
                ];
            });

            CustomerInvoiceDetail::insert($orders->toArray());

            DB::commit();   //保存
            return $this->responseSuccess($customerInvoice->id);
        }catch (\Exception $exception){
            DB::rollBack(); //回滚
            return $this->setStatusCode(422)->responseError($exception->getMessage());
        }

    }


    public function show($id, Content $content)
    {
        $customerInvoice = CustomerInvoice::with('customer', 'customerInvoiceDetails.customerOrder')->find($id);

        return $content
            ->title($this->title())
            ->description($this->description['show'] ?? trans('admin.show'))
            ->body(view('admin/customer_invoice_detail', compact('customerInvoice')));
    }
}
