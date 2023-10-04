<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Audition;

class AuditionController extends Controller
{
    public function create(Request $request) {
        Audition::create([
            'username' => $request->username,
            'interest' => $request->interest,
            'photo_url' => $request->photo_url,
            'description' => $request->description
        ]);

        return response()->json(['message' => 'Success'], 200);
    }
}
