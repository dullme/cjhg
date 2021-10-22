<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerOrder extends BaseModel
{
    use HasFactory;

    protected $fillable = [
        'no',
        'last_number',
        'commission',
        'vat',
        'freight',
        'logistics',
        'customer_id',
        'order_time',
        'amount',
        'invoice',
        'invoiced',
        'pick_up_date',
        'pick_up',
        'transportation',
        'deliver_goods',
        'remarks',
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function orderInfoes()
    {
        return $this->hasMany(OrderInfo::class);
    }

    public function solds()
    {
        return $this->hasMany(Sold::class);
    }

    public function customerInvoiceDetails()
    {
        return $this->hasMany(CustomerInvoiceDetail::class);
    }
}
