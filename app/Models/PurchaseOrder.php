<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchaseOrder extends BaseModel
{
    use HasFactory;

    protected $fillable = [
        'no',
        'supplier_id',
        'order_time',
        'last_number',

    ];

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    public function warehouses()
    {
        return $this->hasMany(Warehouse::class);
    }
}
