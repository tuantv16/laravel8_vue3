<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products';
    protected $fillable = ['name'];

    public $timestamps = true;

    public function stores() {
        return $this->belongsToMany(Store::class, 'product_store', 'product_id', 'store_id');
    }

}
