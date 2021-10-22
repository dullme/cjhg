<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Supplier extends BaseModel
{
    use HasFactory;

    public function purchaseOrders()
    {
        return $this->hasMany(PurchaseOrder::class)->with('warehouses');
    }

    public function supplierInvoice()
    {
        return $this->hasMany(SupplierInvoice::class);
    }
}
