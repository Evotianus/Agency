<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function register(Request $request) {
        $userCount = User::count() + 1;
        $userId = sprintf("USR-%03d", $userCount);

        User::create([
            'user_id' => $userId,
            'username' => $request->username,
            'password' => $request->password,
            'phone_number' => $request->phone_number,
            'email' => $request->email,
            'address' => $request->address,
        ]);

        return response()->json(['message' => 'User Registered Successfully!'], 200);
    }

    public function login(Request $request) {
        $user = User::where('username', '=', $request->username)->where('password', '=', $request->password)->first();

        if ($user === null) {
            return response()->json(['message' => 'Login Failed!'], 201);
        }

        return response()->json($user, 200);
    }
}
