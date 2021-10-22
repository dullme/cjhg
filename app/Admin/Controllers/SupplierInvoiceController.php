<?php

namespace App\Admin\Controllers;

use App\Models\Supplier;
use App\Models\SupplierInvoice;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SupplierInvoiceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'SupplierInvoice';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new SupplierInvoice());

        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();

            // 在这里添加字段过滤器
            $filter->equal('supplier_id', '供应商名称')->select(Supplier::pluck('name', 'id'));

        });

        $grid->supplier()->name('供应商名称');
        $grid->column('no', __('发票号'));
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
        $show = new Show(supplierInvoice::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('supplier_id', __('Supplier id'));
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
        $form = new Form(new supplierInvoice());

        $form->select('supplier_id', __('供应商'))->options(Supplier::pluck('name', 'id'))->required();
        $form->text('no', __('发票号'))
            ->rules(['required', "unique:supplier_invoices,no,{{id}}"]);
        $form->date('date', __('开票日期'))->default(date('Y-m-d'))->required();
        $form->currency('amount', __('金额'))->symbol('￥')->required();
        $form->image('images', __('发票'));

        return $form;
    }
}
