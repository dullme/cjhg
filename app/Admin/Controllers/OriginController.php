<?php

namespace App\Admin\Controllers;

use App\Models\Origin;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class OriginController extends ResponseController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Origin';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Origin());

//        $grid->column('id', __('Id'));
        $grid->column('name', __('产地名称'));
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
        $show = new Show(Origin::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('产地名称'));
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
        $form = new Form(new Origin());

        $form->text('name', __('产地名称'));

        return $form;
    }

    public function getOrigins()
    {
        return Origin::pluck('name');
    }
}
