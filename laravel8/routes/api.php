<?php

use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\PostsController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });


// Route::get('/posts', [PostsController::class, 'index']);
// Route::post('/posts/create', [PostsController::class, 'store']);
// Route::get('/posts/show/{id}', [PostsController::class, 'show']);
// Route::post('/posts/update/{id}', [PostsController::class, 'update']);
// Route::post('/posts/delete/{id}', [PostsController::class, 'destroy']);
Route::resource('/posts', PostsController::class);

Route::resource('/category', CategoryController::class);