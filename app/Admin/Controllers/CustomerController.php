<?php

namespace App\Admin\Controllers;

use App\Models\Customer;
use App\Models\Supplier;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CustomerController extends ResponseController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Customer';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Customer());
        $grid->model()->with('customerOrders');

        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            // 在这里添加字段过滤器
            $filter->like('name', '客户');

            $filter->like('tax_number', '税号');

        });


        $grid->column('name', __('客户名称'))->display(function ($name){
            $url = url('/admin/customer-invoices?&customer_id='.$this->id);
            return "<a href='{$url}'>{$name}</a>";
        });

        $grid->column('tax_number', '税号');

        $grid->customerInvoice( __('发票总数'))->count();

        $grid->column('amount', __('订单总金额'))->display(function (){
            return '¥'.bigNumber(collect($this->customerOrders)->sum('amount'))->getValue();
        });

        $grid->column('receivable', __('应收金额'))->display(function (){
            $amount = bigNumber(collect($this->customerOrders)->sum('amount'))->subtract(bigNumber(collect($this->customerPayment)->sum('amount'))->getValue())->getValue();


            $color = $amount > 0 ? 'text-danger' : 'text-success';
            return "<span class='{$color}' style='font-weight: bold'>¥ {$amount}</span>";

        });

        $grid->column('invoiced', __('已开票金额'))->display(function (){
            return '¥'.bigNumber(collect($this->customerOrders)->sum('invoiced'))->getValue();
        });

        $grid->column('invoice', __('待开票金额'))->display(function (){
            return '¥'.bigNumber(collect($this->customerOrders)->sum('invoice'))->getValue();
        });

        $grid->column('customer_payment', __('付款总金额'))->display(function (){
            return '¥'.bigNumber(collect($this->customerPayment)->sum('amount'))->getValue();
        });



//        $grid->column('address', __('地址'));
        $grid->column('tel', __('电话'));
//        $grid->column('bank', __('开户行'));
//        $grid->column('account', __('银行账号'));
//        $grid->column('created_at', __('创建时间'));


        return $grid;
    }

    public function getCustomers()
    {
        $q = request()->input('q');
        $customers = Customer::where('name', 'like', '%'.$q.'%')->get();

        return response()->json($customers);
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Customer::findOrFail($id));
        $show->field('id', __('Id'));
        $show->field('name', __('客户名称'));
        $show->field('tax_number', __('税号'));
        $show->field('address', __('地址'));
        $show->field('tel', __('电话'));
        $show->field('bank', __('开户行'));
        $show->field('account', __('银行账号'));

        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('更新时间'));


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Customer());

        $form->text('name', __('客户名称'))->creationRules(['required', "unique:customers"])
            ->updateRules(['required', "unique:customers,name,{{id}}"]);
        $form->text('tax_number', __('税号'))->creationRules(['required', "unique:customers"])
            ->updateRules(['required', "unique:customers,tax_number,{{id}}"]);
        $form->text('address', __('地址'));
        $form->text('tel', __('电话'));
        $form->text('bank', __('开户行'));
        $form->text('account', __('银行账号'));

        return $form;
    }
}
