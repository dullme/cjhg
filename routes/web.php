<?php

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
    $a = '506,$63.85,270,$59.48,62,$30.47,366,$44.74,12,$41.69,772,$4.86,1494,$8.43,480,$12.00,64,$15.57,22,$19.14,';
    $res = explode(' ', $a);

    $filter1 = array_filter($res,function($var){
        return(!($var & 1));
    },ARRAY_FILTER_USE_KEY);

    $filter2 = array_filter($res,function($var){
        return($var & 1);
    },ARRAY_FILTER_USE_KEY);

    foreach ($filter1 as $item){
        $item = str_replace(',', '', $item);
        echo ($item/2).'<br/>';
        echo ($item/2).'<br/>';
    }
echo "<br/><br/><br/>";
die();
    return view('welcome', compact('filter1', 'filter2'));
});



