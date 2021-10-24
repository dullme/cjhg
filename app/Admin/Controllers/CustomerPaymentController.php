<?php

namespace App\Admin\Controllers;

use App\Models\Customer;
use App\Models\CustomerPayment;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CustomerPaymentController extends ResponseController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'CustomerPayment';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerPayment());
        $grid->model()->orderByDesc('id');

        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            // 在这里添加字段过滤器
            $filter->equal('customer_id', '客户名称')->select(Customer::pluck('name', 'id'));
        });

        $grid->customer()->name('客户');
        $grid->column('method', __('付款方式'))->display(function ($method){
            return paymentMethod()[$method];
        });
        $grid->column('no', __('付款编号'));
        $grid->column('amount', __('付款金额'))->display(function ($amount){
            return '¥'.$amount;
        });
        $grid->column('to_be_written_off', __('待核销'))->display(function ($to_be_written_off){
            $color = $to_be_written_off > 0 ? 'text-danger' : 'text-success';
            return "<span class='{$color}'>¥{$to_be_written_off}</span>";
        });
        $grid->column('written_off', __('已核销'))->display(function ($written_off){
            return '¥'.$written_off;
        });
        $grid->column('payment_at', __('付款时间'))->display(function ($payment_at){
            return substr($payment_at, 0, 10);
        });
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
        $show = new Show(CustomerPayment::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('customer_id', __('Customer id'));
        $show->field('method', __('Method'));
        $show->field('no', __('No'));
        $show->field('amount', __('Amount'));
        $show->field('to_be_written_off', __('To be written off'));
        $show->field('written_off', __('Written off'));
        $show->field('remark', __('Remark'));
        $show->field('files', __('Files'));
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
        $form = new Form(new CustomerPayment());

        $form->hidden('to_be_written_off');
        $form->select('customer_id', __('客户'))->options(Customer::pluck('name', 'id'));
        $form->select('method', __('付款方式'))->options(paymentMethod());
        $form->text('no', __('付款编号'));
        $form->decimal('amount', __('付款金额'));
        $form->date('payment_at', '付款时间');
        $form->text('remark', __('备注'));
        $form->multipleFile('files', __('凭证'))->removable();

        if($form->isCreating()){
            $form->saving(function (Form $form) {
                $form->to_be_written_off = $form->amount;
            });
        }


        return $form;
    }

    public function getPaymentMethod()
    {
        return paymentMethod();
    }
}
