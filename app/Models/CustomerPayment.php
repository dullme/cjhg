<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerPayment extends BaseModel
{
    use HasFactory;

    public function setFilesAttribute($files)
    {
        if (is_array($files)) {
            $this->attributes['files'] = json_encode($files);
        }
    }

    public function getFilesAttribute($files)
    {
        return json_decode($files, true);
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}
