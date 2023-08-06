<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\ExcMoneyRate;
use Illuminate\Support\Facades\Cache;

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

    public function goldStatus()
    {
        $apiKey = "goldapi-49dg4t7rljla2qux-io";

        $response = Http::withHeaders([
            'x-access-token' => $apiKey,
            'Content-Type' => 'application/json',
        ])->get("https://www.goldapi.io/api/stat");

        if ($response->failed()) {
            $error = $response->body();
            return 'Error: ' . $error;
        } else {
            $data = $response->json();

            return $data;
        }
    }

    public function goldPriceBI()
    {
        $cacheKey = 'gold_price_data';
        $cachedData = Cache::get($cacheKey);

        $moneyRate = ExcMoneyRate::where('exc_money', 'AED')->first(['usd', 'exc_money', 'exc_rate']);
        $response = Http::get("https://markets.businessinsider.com/ajax/finanzen/api/commodities?urls=gold-price");
        $newData = $response->json();
        if ($cachedData !== $newData) {
            Cache::put($cacheKey, $newData, now()->addMinutes(2)); // Cache for 2 minutes
            if ($response->failed()) {
                $error = $response->body();
                return 'Error: ' . $error;
            } else {
                // send real data 
                $data = $response->json();
    
                $quoteData = $data[0]['Quotes'][0];
                $currencyIsoCode = $quoteData['CurrencyIsoCode'];
                $lastPriceDateTime = $quoteData['LastPriceDateTime'];
                $previousClosePrice = $quoteData['PreviousClosePrice'];
                $lastPrice = $quoteData['LastPrice'];
                $changeAbsolute = $quoteData['ChangeAbsolute'];
                $changePercent = $quoteData['ChangePercent'];
                $absoluteValueAsk = .90;
                $absoluteValueBid = .45;
    
                // calculation:
                $UsdPrice  = $previousClosePrice - $changeAbsolute;
                $UsdLowPrice =  ($UsdPrice + ($changePercent * 5)) - 2;
                $UsdHighPrice =  ($previousClosePrice - $changeAbsolute - ($changePercent * 2)) + 2;
                $UsdAsk = ($UsdPrice - $changePercent) + $absoluteValueAsk;
                $UedBid = ($UsdPrice + $changePercent) - $absoluteValueBid;
                $p_24k = ($UsdPrice * (24 / 24)) / 31.1035;
                $p_22k = ($UsdPrice * (22 / 24)) / 31.1035;
                $p_21k = ($UsdPrice * (21 / 24)) / 31.1035;
                $p_20k = ($UsdPrice * (20 / 24)) / 31.1035;
                $p_18k = ($UsdPrice * (18 / 24)) / 31.1035;
                $p_16k = ($UsdPrice * (16 / 24)) / 31.1035;
                $p_14k = ($UsdPrice * (14 / 24)) / 31.1035;
                $p_10k = ($UsdPrice * (10 / 24)) / 31.1035;
                $p_TTB = (($UsdPrice * (24 / 24)) / 31.1035) * 116.64;
                $p_KB995 = (($UsdPrice * (22 / 24)) / 31.1035) * 1000;
                $p_KB999 = (($UsdPrice * (24 / 24)) / 31.1035) * 1000;
               
                return [
                    [
                        'CurrencyIsoCode' => $currencyIsoCode,
                        'previousClosePrice' => number_format($previousClosePrice,2),
                        'openPrice' => number_format($previousClosePrice,2),
                        'lowPrice' => number_format($previousClosePrice,2),
                        'highPrice' => number_format($UsdHighPrice,2),
                        'openTime' => $lastPriceDateTime,
                        'price' => number_format($UsdPrice,2),
                        'changeAbsolute' => $changeAbsolute,
                        'changePercent' => $changePercent,
                        'ask' => number_format($UsdAsk,2),
                        'bid' => number_format($UedBid,2),
                        'price_gram_24k' => number_format($p_24k,2),
                        'price_gram_22k' => number_format($p_22k,2),
                        'price_gram_21k' => number_format($p_21k,2),
                        'price_gram_20k' => number_format($p_20k,2),
                        'price_gram_18k' => number_format($p_18k,2),
                        'price_gram_16k' => number_format($p_16k,2),
                        'price_gram_14k' => number_format($p_14k,2),
                        'price_gram_10k' => number_format($p_10k,2),
                        'TTB' =>   number_format($p_TTB,2),
                        'KB995' => number_format($p_KB995,2),
                        'KB999' => number_format($p_KB999,2),
                    ],
                    [
                        'CurrencyIsoCode' => $moneyRate->exc_money,
                        'previousClosePrice' => number_format($previousClosePrice * $moneyRate->exc_rate,2),
                        'openPrice' => number_format($previousClosePrice * $moneyRate->exc_rate,2),
                        'lowPrice' => number_format($previousClosePrice * $moneyRate->exc_rate,2),
                        'highPrice' => number_format($UsdHighPrice * $moneyRate->exc_rate,2),
                        'openTime' => $lastPriceDateTime,
                        'price' => number_format(($UsdPrice * $moneyRate->exc_rate),2),
                        'changeAbsolute' => $changeAbsolute * $moneyRate->exc_rate,
                        'changePercent' => $changePercent * $moneyRate->exc_rate,
                        'ask' => number_format(($UsdAsk * $moneyRate->exc_rate),2),
                        'bid' => number_format(($UedBid * $moneyRate->exc_rate),2),
                        'price_gram_24k' => number_format(($p_24k * $moneyRate->exc_rate),2),
                        'price_gram_22k' => number_format(($p_22k * $moneyRate->exc_rate),2),
                        'price_gram_21k' => number_format(($p_21k * $moneyRate->exc_rate),2),
                        'price_gram_20k' => number_format(($p_20k * $moneyRate->exc_rate),2),
                        'price_gram_18k' => number_format(($p_18k * $moneyRate->exc_rate),2),
                        'price_gram_16k' => number_format(($p_16k * $moneyRate->exc_rate),2),
                        'price_gram_14k' => number_format(($p_14k * $moneyRate->exc_rate),2),
                        'price_gram_10k' => number_format(($p_10k * $moneyRate->exc_rate),2),
                        'TTB' => number_format((($p_24k * $moneyRate->exc_rate) * 116.64),2),
                        'KB995' => number_format((($p_22k * $moneyRate->exc_rate) * 1000),2),
                        'KB999' => number_format((($p_24k * $moneyRate->exc_rate) * 1000),2),
                    ]
                ];
            }
        } else {
            // Generate and return fake data
            $data = $response->json();
    
            $quoteData = $data[0]['Quotes'][0];
            $currencyIsoCode = $quoteData['CurrencyIsoCode'];
            $lastPriceDateTime = $quoteData['LastPriceDateTime'];
            $previousClosePrice = $quoteData['PreviousClosePrice']+rand(1, 3);
            $lastPrice = $quoteData['LastPrice']+rand(1, 3);
            $changeAbsolute = $quoteData['ChangeAbsolute'];
            $changePercent = $quoteData['ChangePercent'];
            $absoluteValueAsk = .90;
            $absoluteValueBid = .45;

            // calculation:
            $UsdPrice  = ($previousClosePrice - $changeAbsolute)+rand(1, 3);
            $UsdLowPrice =  ($UsdPrice + ($changePercent * 5)) - rand(1, 3);
            $UsdHighPrice =  ($previousClosePrice - $changeAbsolute - ($changePercent * 2)) + rand(1, 3);
            $UsdAsk = (($UsdPrice+rand(1, 3)) - $changePercent) + $absoluteValueAsk;
            $UedBid = (($UsdPrice+rand(1, 3)) + $changePercent) - $absoluteValueBid;
            $p_24k = ($UsdPrice * (24 / 24)) / 31.1035;
            $p_22k = ($UsdPrice * (22 / 24)) / 31.1035;
            $p_21k = ($UsdPrice * (21 / 24)) / 31.1035;
            $p_20k = ($UsdPrice * (20 / 24)) / 31.1035;
            $p_18k = ($UsdPrice * (18 / 24)) / 31.1035;
            $p_16k = ($UsdPrice * (16 / 24)) / 31.1035;
            $p_14k = ($UsdPrice * (14 / 24)) / 31.1035;
            $p_10k = ($UsdPrice * (10 / 24)) / 31.1035;
            $p_TTB = (($UsdPrice * (24 / 24)) / 31.1035) * 116.64;
            $p_KB995 = (($UsdPrice * (22 / 24)) / 31.1035) * 1000;
            $p_KB999 = (($UsdPrice * (24 / 24)) / 31.1035) * 1000;
            return [
                [
                    'CurrencyIsoCode' => $currencyIsoCode,
                    'previousClosePrice' => number_format($previousClosePrice,2),
                    'openPrice' => number_format($previousClosePrice,2),
                    'lowPrice' => number_format($previousClosePrice,2),
                    'highPrice' => number_format($UsdHighPrice,2),
                    'openTime' => $lastPriceDateTime,
                    'price' => number_format($UsdPrice,2),
                    'changeAbsolute' => $changeAbsolute,
                    'changePercent' => $changePercent,
                    'ask' => number_format($UsdAsk,2),
                    'bid' => number_format($UedBid,2),
                    'price_gram_24k' => number_format($p_24k,2),
                    'price_gram_22k' => number_format($p_22k,2),
                    'price_gram_21k' => number_format($p_21k,2),
                    'price_gram_20k' => number_format($p_20k,2),
                    'price_gram_18k' => number_format($p_18k,2),
                    'price_gram_16k' => number_format($p_16k,2),
                    'price_gram_14k' => number_format($p_14k,2),
                    'price_gram_10k' => number_format($p_10k,2),
                    'TTB' =>   number_format($p_TTB,2),
                    'KB995' => number_format($p_KB995,2),
                    'KB999' => number_format($p_KB999,2),
                ],
                [
                    'CurrencyIsoCode' => $moneyRate->exc_money,
                    'previousClosePrice' => number_format($previousClosePrice * $moneyRate->exc_rate,2),
                    'openPrice' => number_format($previousClosePrice * $moneyRate->exc_rate,2),
                    'lowPrice' => number_format($previousClosePrice * $moneyRate->exc_rate,2),
                    'highPrice' => number_format($UsdHighPrice * $moneyRate->exc_rate,2),
                    'openTime' => $lastPriceDateTime,
                    'price' => number_format(($UsdPrice * $moneyRate->exc_rate),2),
                    'changeAbsolute' => $changeAbsolute * $moneyRate->exc_rate,
                    'changePercent' => $changePercent * $moneyRate->exc_rate,
                    'ask' => number_format(($UsdAsk * $moneyRate->exc_rate),2),
                    'bid' => number_format(($UedBid * $moneyRate->exc_rate),2),
                    'price_gram_24k' => number_format(($p_24k * $moneyRate->exc_rate),2),
                    'price_gram_22k' => number_format(($p_22k * $moneyRate->exc_rate),2),
                    'price_gram_21k' => number_format(($p_21k * $moneyRate->exc_rate),2),
                    'price_gram_20k' => number_format(($p_20k * $moneyRate->exc_rate),2),
                    'price_gram_18k' => number_format(($p_18k * $moneyRate->exc_rate),2),
                    'price_gram_16k' => number_format(($p_16k * $moneyRate->exc_rate),2),
                    'price_gram_14k' => number_format(($p_14k * $moneyRate->exc_rate),2),
                    'price_gram_10k' => number_format(($p_10k * $moneyRate->exc_rate),2),
                    'TTB' => number_format((($p_24k * $moneyRate->exc_rate) * 116.64),2),
                    'KB995' => number_format((($p_22k * $moneyRate->exc_rate) * 1000),2),
                    'KB999' => number_format((($p_24k * $moneyRate->exc_rate) * 1000),2),
                ]
            ];
        }  
    }
}
