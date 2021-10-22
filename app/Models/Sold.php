<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sold extends Model
{
    use HasFactory;

    protected $fillable = [
        'item_id',
        'warehouse_id',
        'customer_order_id',
        'sales_price',
        'purchase_price',
        'quantity',
        'sales_total',
        'purchase_total',
        'origin',
    ];

    public function item()
    {
        return $this->belongsTo(Item::class);
    }

    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class);
    }

    public function customerOrder()
    {
        return $this->belongsTo(CustomerOrder::class);
    }
}
