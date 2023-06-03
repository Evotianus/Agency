<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ApiController extends Controller
{
    public function createUser() {
        return response()->json([
            'Halo' => 'Hai',
        ], 200);
        // return "hai";
    }
}
