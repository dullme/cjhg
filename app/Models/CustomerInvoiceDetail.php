<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerInvoiceDetail extends Model
{
    use HasFactory;

    public function customerOrder()
    {
        return $this->belongsTo(CustomerOrder::class);
    }

    public function customerInvoice()
    {
        return $this->belongsTo(CustomerInvoice::class);
    }
}
