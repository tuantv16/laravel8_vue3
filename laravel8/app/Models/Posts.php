<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Posts extends Model
{
    use HasFactory;

    protected $table = 'posts';
    protected $fillable = ['title', 'description', 'hobbie', 'gender', 'category_id'];

    public $timestamps = true;

    public function category() {
        return $this->belongsTo(Category::class, 'category_id');
    }

}
