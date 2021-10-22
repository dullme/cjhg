<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerInvoiceDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_invoice_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('customer_invoice_id')->comment('客户发票ID');
            $table->unsignedBigInteger('customer_order_id')->comment('客户订单ID');
            $table->decimal('invoice', 10, 2)->comment('开票金额');
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
        Schema::dropIfExists('customer_invoice_details');
    }
}
