<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;


class GoldFrontEnd extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
     * @param  \App\Models\GoldFrontEnd  $goldFrontEnd
     * @return \Illuminate\Http\Response
     */
    public function show(GoldFrontEnd $goldFrontEnd)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\GoldFrontEnd  $goldFrontEnd
     * @return \Illuminate\Http\Response
     */
    public function edit(GoldFrontEnd $goldFrontEnd)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GoldFrontEnd  $goldFrontEnd
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GoldFrontEnd $goldFrontEnd)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GoldFrontEnd  $goldFrontEnd
     * @return \Illuminate\Http\Response
     */
    public function destroy(GoldFrontEnd $goldFrontEnd)
    {
        //
    }

    // public function goldDetails()  {
    //     dd('work');
    //     return 'work';
    // }
    public function goldPrice()
    {
        $apiKey = "goldapi-49dg4t7rljla2qux-io";
        $symbol = "XAU";
        $curr = "AED";
        $date = "";

        $response = Http::withHeaders([
            'x-access-token' => $apiKey,
            'Content-Type' => 'application/json',
        ])->get("https://www.goldapi.io/api/{$symbol}/{$curr}{$date}");

        if ($response->failed()) {
            $error = $response->body();
            return 'Error: ' . $error;
        } else {
            $data = $response->json();
            
            return $data;
        }
    }
}
