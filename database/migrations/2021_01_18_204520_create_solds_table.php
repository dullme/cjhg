<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSoldsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('solds', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('item_id')->comment('产品');
            $table->unsignedBigInteger('warehouse_id')->comment('产品库存ID');
            $table->unsignedBigInteger('customer_order_id')->comment('客户订单ID');
            $table->decimal('sales_price', 10, 2)->comment('销售单价');
            $table->decimal('purchase_price', 10, 2)->comment('进货单价');
            $table->integer('quantity')->comment('数量');
            $table->decimal('sales_total')->comment('销售总金额');
            $table->decimal('purchase_total')->comment('采购总金额');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('solds');
    }
}
