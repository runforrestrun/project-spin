<?php

use App\Http\Controllers\GitController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/version', [GitController::class, 'getGitObjectsTimestamp'])->name('version');
