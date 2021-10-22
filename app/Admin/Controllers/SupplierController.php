<?php

namespace App\Admin\Controllers;

use App\Models\Supplier;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class SupplierController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Supplier';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Supplier());
//        $grid->model()->with('purchaseOrders');

//        $grid->column('id', __('Id'));
        $grid->column('name', __('供应商名称'))->display(function ($name){
            $url = url('/admin/suppliers/'.$this->id);
            return "<a href='{$url}'>{$name}</a>";
        });
        $grid->purchaseOrders('采购总金额')->display(function ($purchaseOrders){

            $purchaseOrders = collect($purchaseOrders)->where('warehouses', '!=', [])->pluck('warehouses')->map(function ($item){
                return collect($item)->sum('total');
            });
            return $purchaseOrders->sum();
        });
        $grid->supplierInvoice(__('已开票总金额'))->display(function ($supplierInvoice){
            $url = url('/admin/supplier-invoices?&supplier_id='.$this->id);
            $amount = collect($supplierInvoice)->sum('amount');
            return "<a href='{$url}'>{$amount}</a>";
        });

        $grid->column('待开票总金额')->display(function (){
            $purchaseOrders = collect($this->purchaseOrders)->where('warehouses', '!=', [])->pluck('warehouses')->map(function ($item){
                return collect($item)->sum('total');
            })->sum();

            $supplierInvoice = $this->supplierInvoice->sum('amount');
            $amount = $purchaseOrders-$supplierInvoice;
            if($amount < 0){
                return "<span style='color: #cb2027'>$amount</span>";
            }

            return $amount;
        });
//        $grid->column('tax_number', __('税号'));
//        $grid->column('address', __('地址'));
        $grid->column('tel', __('电话'));
//        $grid->column('bank', __('开户行'));
//        $grid->column('account', __('银行账号'));
//        $grid->column('created_at', __('创建时间'));
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
        $show = new Show(Supplier::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('供应商名称'));
        $show->field('tax_number', __('税号'));
        $show->field('address', __('地址'));
        $show->field('tel', __('电话'));
        $show->field('bank', __('开户行'));
        $show->field('account', __('银行账号'));
        $show->field('created_at', __('创建时间'));
        $show->field('updated_at', __('更新时间'));

        return $show;
    }

    public function supplier()
    {
        $q = request()->input('q');
        $products = Supplier::where('name', 'like', '%'.$q.'%')->get();

        return response()->json($products);
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Supplier());

        $form->text('name', __('供应商名称'));
        $form->text('tax_number', __('税号'));
        $form->text('address', __('地址'));
        $form->text('tel', __('电话'));
        $form->text('bank', __('开户行'));
        $form->text('account', __('银行账号'));

        return $form;
    }
}
