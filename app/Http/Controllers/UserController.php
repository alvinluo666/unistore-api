<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function register(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:55',
            'phone' => 'required|unique:users|regex:/(959)[0-9]{9}/',
            'password' => 'required|min:6|regex:/^.*(?=.{3,})(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\d\x])(?=.*[!$#%]).*$/|confirmed'
        ]);

        $validatedData['password'] = bcrypt($request->password);

        $user = User::create($validatedData);

        $accessToken = $user->createToken('authToken')->accessToken;

        return response()->json([ 'user' => $user, 'access_token' => $accessToken],200);
    }

    public function login(Request $request)
    {
        $loginData = $request->validate([
            'phone' => 'required',
            'password' => 'required'
        ]);
       

        if (!auth()->attempt($loginData)) {
            return response()->json(['message' => 'Invalid Credentials'],422);
        }

        $accessToken = auth()->user()->createToken('authToken')->accessToken;

        return response()->json(['user' => auth()->user(), 'access_token' => $accessToken],200);

    }

	public function logout (Request $request) {
	    $token = auth()->user('api')->token();
	    $token->revoke();
	    $response = ['message' => 'You have logout!'];
	    return response()->json($response, 200);
	}

    public function getUserInfo(Request $request) {
        return response()->json(['user'=>auth()->user()],200);
    }
}
