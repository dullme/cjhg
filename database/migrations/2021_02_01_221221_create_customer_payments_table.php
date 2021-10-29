<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_payments', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('customer_id')->comment('客户');
            $table->string('method')->comment('付款方式');
            $table->string('no')->unique()->comment('付款编号');
            $table->decimal('amount',15,5)->comment('付款金额');
            $table->decimal('to_be_written_off',15,5)->comment('待核销');
            $table->decimal('written_off',15,5)->default(0)->comment('已核销');
            $table->timestamp('payment_at')->comment('付款时间');
            $table->string('remark')->nullable()->comment('备注');
            $table->string('files')->nullable()->comment('凭证');
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
        Schema::dropIfExists('customer_payments');
    }
}
