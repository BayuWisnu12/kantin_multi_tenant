<?php

use Illuminate\Support\Facades\Route;

Route::view('/', 'welcome')->name('home');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::view('dashboard', 'dashboard')->name('dashboard');
    Route::view('/register', 'pages.auth.register')->name('register');
});

require __DIR__.'/settings.php';

// --- TAMBAHKAN KEMBALI BARIS INI UNTUK BYPASS ERROR PASSKEY ---
Route::get('/passkey-dummy-login-options', function () {})->name('passkey.login-options');
Route::post('/passkey-dummy-login', function () {})->name('passkey.login');
Route::get('/passkey-dummy-confirm-options', function () {})->name('passkey.confirm-options');
Route::post('/passkey-dummy-confirm', function () {})->name('passkey.confirm');
