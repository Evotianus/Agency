<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\EventController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('api-test', [ApiController::class, 'createUser']);
Route::post('get-product', [ProductController::class, 'index']);
Route::post('show-product/{id}', [ProductController::class, 'show']);
Route::post('buy-product', [ProductController::class, 'purchase']);

Route::post('get-news', [NewsController::class, 'index']);
Route::post('show-news/{id}', [NewsController::class, 'show']);
Route::post('insert-news', [NewsController::class, 'create']);

Route::post('register-user', [UserController::class, 'register']);
Route::post('login-user', [UserController::class, 'login']);

Route::post('get-event', [EventController::class, 'index']);
Route::post('buy-ticket', [EventController::class, 'purchase']);
