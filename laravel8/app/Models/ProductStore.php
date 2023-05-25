<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductStore extends Model
{
    use HasFactory;
    protected $table = 'product_store';
    protected $fillable = ['product_id', 'category_id'];
}
