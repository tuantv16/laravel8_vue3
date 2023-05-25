<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    use HasFactory;

    protected $table = 'stores';
    protected $fillable = ['name', 'des_info'];
  
    public $timestamps = true;
  
    public function products() {
      return $this->belongsToMany(Product::class, 'product_store', 'product_id', 'store_id');
    }
}
