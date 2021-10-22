<?php

namespace App\Admin\Controllers;

use App\Models\Item;
use App\Models\Origin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\MessageBag;
use Overtrue\Pinyin\Pinyin;

class ItemController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Item';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Item());
        $grid->model()->orderByDesc('id');
        $grid->filter(function($filter){

            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $items = Item::pluck('name')->values()->unique()->toArray();
            $item_options = [];
            foreach ($items as $item){
                $item_options[$item] = $item;
            }
            // 在这里添加字段过滤器
            $filter->equal('name', '产品名称	')->select($item_options);

        });


        $grid->origin()->name(__('产地'));
        $grid->column('name', __('产品名称'));
        $grid->column('weight', '重量')->display(function ($weight){
            return $weight.' kg/'.$this->unit;
        })->label();


        $grid->column('total_quantity', __('采购总数'))->display(function (){
            return $this->warehouse->sum('quantity');
        });

        $grid->column('sold', __('已销售总数'))->display(function (){
            return $this->warehouse->sum('sold');
        });

        $grid->column('for_sale', __('剩余库存'))->display(function (){
            return $this->warehouse->sum('for_sale');
        });

        $grid->column('sold_price', __('已销售总金额'))->display(function (){
            $warehouse = collect($this->warehouse)->map(function ($item){
                return [
                    'sold_price' => bigNumber($item['sold'])->multiply($item['unit_price'])->getValue()
                ];
            });

            return '¥ ' .bigNumber($warehouse->sum('sold_price'))->getValue();
        });

        $grid->column('for_sale_price', __('库存货值'))->display(function (){
            $warehouse = collect($this->warehouse)->map(function ($item){
                return [
                    'for_sale_price' => bigNumber($item['for_sale'])->multiply($item['unit_price'])->getValue()
                ];
            });

            return '¥ ' .bigNumber($warehouse->sum('for_sale_price'))->getValue();
        });
        
        $grid->column('created_at', __('创建时间'));
//        $grid->column('updated_at', __('Updated at'));

        return $grid;
    }

    public function getItems()
    {
        $q = request()->input('q');
        $items = Item::with('origin')->where('name', 'like', '%'.$q.'%')->get();

        return response()->json($items);
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Item::findOrFail($id));

//        $show->field('id', __('Id'));
        $show->field('name', __('产品名称'));
        $show->field('search_name', __('简称'));
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
        $form = new Form(new Item());

        $form->select('origin_id', __('产地'))->options(Origin::pluck('name', 'id'));
        $form->text('name', __('产品名称'))->required();
        $form->hidden('search_name', __('Search name'));
        $form->decimal('weight', '重量')->required();
        $form->select('unit', '单位')->options(unit())->setWidth(1)->required();



        $form->saving(function (Form $form) {

            $items = Item::where([
                'name' => $form->name,
                'weight' => intval($form->weight*1000)/1000,
                'unit' => $form->unit,
            ])->count();

            if($form->isCreating() && $items){
                $error = new MessageBag([
                    'title'   => '出错了',
                    'message' => '该产品已存在',
                ]);

                return back()->with(compact('error'));
            }

            $pinyin = new Pinyin();
            $form->search_name = $pinyin->abbr($form->name,PINYIN_KEEP_NUMBER);
        });

        return $form;
    }
}
