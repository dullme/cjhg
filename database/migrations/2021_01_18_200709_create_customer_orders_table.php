<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_orders', function (Blueprint $table) {
            $table->id();
            $table->string('no')->unique()->comment('订单编号');
            $table->unsignedBigInteger('customer_id')->comment('客户');
            $table->integer('last_number');
            $table->integer('commission')->default(0)->comment('佣金');
            $table->decimal('pick_up',10, 2)->comment('提货运费');
            $table->decimal('transportation',10, 2)->comment('运输运费');
            $table->decimal('deliver_goods',10, 2)->comment('送货运费');
            $table->decimal('freight',10, 2)->default(0)->comment('总运费');
            $table->string('logistics')->comment('物流公司');
            $table->decimal('vat', 10, 2)->comment('增值税');
            $table->decimal('amount', 10, 2)->default(0)->comment('订单总金额');
            $table->decimal('invoice', 10, 2)->default(0)->comment('待开票金额');
            $table->decimal('invoiced', 10, 2)->default(0)->comment('已开票金额');
            $table->timestamp('order_time')->comment('下单时间');
            $table->timestamp('pick_up_date')->nullable()->comment('提货日期');
            $table->string('pick_up_object')->nullable()->comment('提货对象');
            $table->string('remarks')->nullable()->comment('备注');
            $table->string('files')->nullable()->comment('文件');
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
        Schema::dropIfExists('customer_orders');
    }
}
