<?php
/**
 * Created by PhpStorm.
 * User: daminghu
 * Date: 2019/1/21
 * Time: 9:35 PM
 */

function route_class()
{
    return str_replace('.', '-', Route::currentRouteName());
}