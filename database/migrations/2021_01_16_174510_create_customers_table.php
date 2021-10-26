<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique()->comment('客户名称');
            $table->string('tax_number')->unique()->comment('税号');
            $table->string('tel')->nullable()->comment('电话');
            $table->string('bank')->nullable()->comment('开户行');
            $table->string('account')->nullable()->comment('银行账号');
            $table->string('address')->nullable()->comment('地址');
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
        Schema::dropIfExists('customers');
    }
}
