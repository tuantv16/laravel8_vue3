<?php

use App\Http\Controllers\PostsController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StoreController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::resource('/profiles', ProfileController::class);
Route::resource('/products', ProductController::class);
Route::resource('/stores', StoreController::class);
//Route::post('/stores/store', [StoreController::class,'store']);

Route::get('/store/send-email', [StoreController::class, 'sendEmail']);