<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Posts;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Validator;

class CategoryController extends Controller
{
    public function index() {

        // $users = DB::table('product_store')
        //              ->select(
        //                     DB::raw('count(*) as total, product_id')
        //                 )
        //              ->where('product_id', '<>', 1)
        //              ->groupBy('product_id')
        //              ->get();
                           
        $data = Category::all();
        return response()->json($data);
    }
}