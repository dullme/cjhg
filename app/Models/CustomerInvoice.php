<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerInvoice extends BaseModel
{
    use HasFactory;

    protected $fillable = [
        'customer_id',
        'no',
        'date',
        'amount'
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function customerInvoiceDetails()
    {
        return $this->hasMany(CustomerInvoiceDetail::class);
    }
}
