<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWarehousesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('warehouses', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('item_id')->comment('产品');
            $table->unsignedBigInteger('purchase_order_id')->comment('PO单号');
            $table->decimal('unit_price', 15, 5)->comment('单价');
            $table->integer('quantity')->comment('数量');
            $table->integer('sold')->comment('已售');
            $table->integer('for_sale')->comment('待售');
            $table->decimal('total', 15, 5)->comment('总金额');
            $table->string('remark')->nullable()->comment('产地');
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
        Schema::dropIfExists('warehouses');
    }
}
