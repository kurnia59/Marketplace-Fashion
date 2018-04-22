<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\ModelProfil;

class Profil extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
		$id = 1;
		$data = ModelProfil::where('USER_ID',$id)->get();

        return view('profil',compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = ModelProfil::where('USER_ID',$id)->first();
		if($request->firstname != NULL) {
			$data->USER_FIRSTNAME = $request->firstname;
			$data->USER_LASTNAME = $request->lastname;
			$data->USER_PHONE = $request->phone;
			$file       = $request->file('foto');
			if($file != NULL) {
				$fileName   = $file->getClientOriginalName();
				$request->file('foto')->move("assets/images/user/", $fileName);
				$data->USER_PROFILE_PIC = $fileName;
			}
			$data->save();
			return redirect()->route('profil.index')->with('berhasil','Success!');
		} elseif ($request->email != NULL) {
			$data->USER_EMAIL = $request->email;
			$data->save();
			return redirect()->route('profil.index')->with('berhasil','Success!');
		} elseif ($request->oldpass != NULL) {
			if ($data->USER_PASSWORD == md5($request->oldpass)) {
				if($request->newpass != $request->newpass1) {
					return redirect()->route('profil.index')->with('gagal','New password not same!');
				} else {
					$data->USER_PASSWORD = md5($request->newpass);
					$data->save();
					return redirect()->route('profil.index')->with('berhasil','Success!');
				}
			} else {
				return redirect()->route('profil.index')->with('gagal','Wrong current password!');
			}
		}
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
