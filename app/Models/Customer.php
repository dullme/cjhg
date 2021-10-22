<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends BaseModel
{
    use HasFactory;

    public function customerOrders()
    {
        return $this->hasMany(CustomerOrder::class);
    }

    public function customerInvoice()
    {
        return $this->hasMany(CustomerInvoice::class);
    }

    public function customerPayment()
    {
        return $this->hasMany(CustomerPayment::class);
    }
}
