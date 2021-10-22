<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends BaseModel
{
    use HasFactory;

    protected $fillable = [
        'name',
        'search_name'
    ];

    public function origin()
    {
        return $this->belongsTo(Origin::class);
    }
}
