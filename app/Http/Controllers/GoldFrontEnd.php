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
                $data = $response->json();

                $quoteData = $data[0]['Quotes'][0];
                $currencyIsoCode = $quoteData['CurrencyIsoCode'];
                $lastPriceDateTime = $quoteData['LastPriceDateTime'];
                $previousClosePrice = $quoteData['PreviousClosePrice'];
                $lastPrice = $quoteData['LastPrice'];
                $changeAbsolute = $quoteData['ChangeAbsolute'];
                $changePercent = $quoteData['ChangePercent'];

                // calculation:
                if ($changeAbsolute > 0) {
                    // Value is positive, so subtract a certain amount
                    $UsdPrice  = $previousClosePrice - $changeAbsolute;
                } elseif ($changeAbsolute < 0) {
                    // Value is negative, so add a certain amount
                    $UsdPrice  = $previousClosePrice + $changeAbsolute;
                    // $adjustedValue = $originalValue + 5;
                } else {
                    // Value is zero, no adjustment needed
                    $UsdPrice  = $lastPrice;
                }

                // calculation:
                if ($changePercent > 0) {
                    // Value is positive, so subtract a certain amount
                    $UsdAsk = ($UsdPrice + $changePercent);
                    $UedBid = ($UsdPrice - $changePercent);
                    $UsdHighPrice =  ($previousClosePrice + $changeAbsolute + $changePercent) + 4;
                    $UsdLowPrice =  ($UsdPrice + ($changePercent * 4)) + 4;
                } elseif ($changePercent < 0) {
                    // Value is negative, so add a certain amount
                    $UsdAsk = ($UsdPrice - $changePercent);
                    $UedBid = ($UsdPrice + $changePercent);
                    $UsdHighPrice = ($previousClosePrice - $changeAbsolute - $changePercent) - 4;
                    $UsdLowPrice =  ($UsdPrice - ($changePercent * 4)) - 4;
                } else {
                    // Value is zero, no adjustment needed
                    $UsdAsk = ($lastPrice + $changePercent);
                    $UedBid = ($lastPrice - $changePercent);
                    $UsdHighPrice =  ($previousClosePrice + $changeAbsolute + $changePercent) + 4;
                    $UsdLowPrice =  ($UsdPrice + ($changePercent * 4)) + 4;
                }

                $p_24k = ($UsdPrice * (24 / 24)) / 31.1035;
                $p_22k = ($UsdPrice * (22 / 24)) / 31.1035;
                $p_21k = ($UsdPrice * (21 / 24)) / 31.1035;
                $p_20k = ($UsdPrice * (20 / 24)) / 31.1035;
                $p_18k = ($UsdPrice * (18 / 24)) / 31.1035;
                $p_16k = ($UsdPrice * (16 / 24)) / 31.1035;
                $p_14k = ($UsdPrice * (14 / 24)) / 31.1035;
                $p_10k = ($UsdPrice * (10 / 24)) / 31.1035;
                $p_TTB = (($UsdPrice * (24 / 24)) / 31.1035) * 116.64;
                $p_TTB_AED = $UsdPrice * 13.7639;
                $p_24_AED = $p_TTB_AED / 116.64;
                $p_22_AED = $p_24_AED * .92;
                $p_KB995 = (($UsdPrice * (22 / 24)) / 31.1035) * 1000;
                $p_KB999 = (($UsdPrice * (24 / 24)) / 31.1035) * 1000;
                return [
                    [
                        'CurrencyIsoCode' => $currencyIsoCode,
                        'openTime' => $lastPriceDateTime,
                        'previousClosePrice' => $previousClosePrice,
                        'openPrice' => $previousClosePrice,
                        'lastPrice' => $lastPrice,
                        'price' => $UsdPrice,
                        'ask' => $UsdAsk,
                        'bid' => $UedBid,
                        'highPrice' => $UsdHighPrice,
                        'lowPrice' => $UsdLowPrice,
                        'changeAbsolute' => $changeAbsolute,
                        'changePercent' => $changePercent,
                        'price_gram_24k' => $p_24k,
                        'price_gram_22k' => $p_22k,
                        'price_gram_21k' => $p_21k,
                        'price_gram_20k' => $p_20k,
                        'price_gram_18k' => $p_18k,
                        'price_gram_16k' => $p_16k,
                        'price_gram_14k' => $p_14k,
                        'price_gram_10k' => $p_10k,
                        'TTB' => $p_TTB,
                        'KB995' => $p_KB995,
                        'KB999' => $p_KB999,
                    ],
                    [
                        'CurrencyIsoCode' => $moneyRate->exc_money,
                        'previousClosePrice' => $previousClosePrice * $moneyRate->exc_rate,
                        'openPrice' => $previousClosePrice * $moneyRate->exc_rate,
                        'lowPrice' => $previousClosePrice * $moneyRate->exc_rate,
                        'highPrice' => $UsdHighPrice * $moneyRate->exc_rate,
                        'openTime' => $lastPriceDateTime,
                        'price' => $UsdPrice * $moneyRate->exc_rate,
                        'changeAbsolute' => $changeAbsolute * $moneyRate->exc_rate,
                        'changePercent' => $changePercent * $moneyRate->exc_rate,
                        'ask' => $UsdAsk * $moneyRate->exc_rate,
                        'bid' => $UedBid * $moneyRate->exc_rate,
                        'price_gram_24k' => $p_24_AED,
                        'price_gram_22k' => $p_22_AED,
                        'price_gram_21k' => $p_21k * $moneyRate->exc_rate,
                        'price_gram_20k' => $p_20k * $moneyRate->exc_rate,
                        'price_gram_18k' => $p_18k * $moneyRate->exc_rate,
                        'price_gram_16k' => $p_16k * $moneyRate->exc_rate,
                        'price_gram_14k' => $p_14k * $moneyRate->exc_rate,
                        'price_gram_10k' => $p_10k * $moneyRate->exc_rate,
                        'TTB' => $p_TTB_AED,
                        'KB995' => $p_KB995 * $moneyRate->exc_rate,
                        'KB999' => $p_KB999 * $moneyRate->exc_rate,
                    ]

                ];
            }
        } else {
            // generate fake data 
            $data = $response->json();

            $quoteData = $data[0]['Quotes'][0];
            $currencyIsoCode = $quoteData['CurrencyIsoCode'];
            $lastPriceDateTime = $quoteData['LastPriceDateTime'];
            $previousClosePrice = $quoteData['PreviousClosePrice']+rand(1, 3);
            $lastPrice = $quoteData['LastPrice']+rand(1, 3);
            $changeAbsolute = $quoteData['ChangeAbsolute'];
            $changePercent = $quoteData['ChangePercent'];

            // calculation:
            if ($changeAbsolute > 0) {
                // Value is positive, so subtract a certain amount
                $UsdPrice  = $previousClosePrice - $changeAbsolute;
            } elseif ($changeAbsolute < 0) {
                // Value is negative, so add a certain amount
                $UsdPrice  = ($previousClosePrice + $changeAbsolute)+rand(1, 3);
                // $adjustedValue = $originalValue + 5;
            } else {
                // Value is zero, no adjustment needed
                $UsdPrice  = $lastPrice+rand(1, 3);
            }

            // calculation:
            if ($changePercent > 0) {
                // Value is positive, so subtract a certain amount
                $UsdAsk = ($UsdPrice + $changePercent);
                $UedBid = ($UsdPrice - $changePercent);
                $UsdHighPrice =  ($previousClosePrice + $changeAbsolute + $changePercent) + 4;
                $UsdLowPrice =  ($UsdPrice + ($changePercent * 4)) + 4;
            } elseif ($changePercent < 0) {
                // Value is negative, so add a certain amount
                $UsdAsk = ($UsdPrice - $changePercent);
                $UedBid = ($UsdPrice + $changePercent);
                $UsdHighPrice = ($previousClosePrice - $changeAbsolute - $changePercent) - 4;
                $UsdLowPrice =  ($UsdPrice - ($changePercent * 4)) - 4;
            } else {
                // Value is zero, no adjustment needed
                $UsdAsk = ($lastPrice + $changePercent);
                $UedBid = ($lastPrice - $changePercent);
                $UsdHighPrice =  ($previousClosePrice + $changeAbsolute + $changePercent) + 4;
                $UsdLowPrice =  ($UsdPrice + ($changePercent * 4)) + 4;
            }

            $p_24k = ($UsdPrice * (24 / 24)) / 31.1035;
            $p_22k = ($UsdPrice * (22 / 24)) / 31.1035;
            $p_21k = ($UsdPrice * (21 / 24)) / 31.1035;
            $p_20k = ($UsdPrice * (20 / 24)) / 31.1035;
            $p_18k = ($UsdPrice * (18 / 24)) / 31.1035;
            $p_16k = ($UsdPrice * (16 / 24)) / 31.1035;
            $p_14k = ($UsdPrice * (14 / 24)) / 31.1035;
            $p_10k = ($UsdPrice * (10 / 24)) / 31.1035;
            $p_TTB = (($UsdPrice * (24 / 24)) / 31.1035) * 116.64;
            $p_TTB_AED = $UsdPrice * 13.7639;
            $p_24_AED = $p_TTB_AED / 116.64;
            $p_22_AED = $p_24_AED * .92;
            $p_KB995 = (($UsdPrice * (22 / 24)) / 31.1035) * 1000;
            $p_KB999 = (($UsdPrice * (24 / 24)) / 31.1035) * 1000;
            return [
                [
                    'CurrencyIsoCode' => $currencyIsoCode,
                    'openTime' => $lastPriceDateTime,
                    'previousClosePrice' => $previousClosePrice,
                    'openPrice' => $previousClosePrice,
                    'lastPrice' => $lastPrice,
                    'price' => $UsdPrice,
                    'ask' => $UsdAsk,
                    'bid' => $UedBid,
                    'highPrice' => $UsdHighPrice,
                    'lowPrice' => $UsdLowPrice,
                    'changeAbsolute' => $changeAbsolute,
                    'changePercent' => $changePercent,
                    'price_gram_24k' => $p_24k,
                    'price_gram_22k' => $p_22k,
                    'price_gram_21k' => $p_21k,
                    'price_gram_20k' => $p_20k,
                    'price_gram_18k' => $p_18k,
                    'price_gram_16k' => $p_16k,
                    'price_gram_14k' => $p_14k,
                    'price_gram_10k' => $p_10k,
                    'TTB' => $p_TTB,
                    'KB995' => $p_KB995,
                    'KB999' => $p_KB999,
                ],
                [
                    'CurrencyIsoCode' => $moneyRate->exc_money,
                    'previousClosePrice' => $previousClosePrice * $moneyRate->exc_rate,
                    'openPrice' => $previousClosePrice * $moneyRate->exc_rate,
                    'lowPrice' => $previousClosePrice * $moneyRate->exc_rate,
                    'highPrice' => $UsdHighPrice * $moneyRate->exc_rate,
                    'openTime' => $lastPriceDateTime,
                    'price' => $UsdPrice * $moneyRate->exc_rate,
                    'changeAbsolute' => $changeAbsolute * $moneyRate->exc_rate,
                    'changePercent' => $changePercent * $moneyRate->exc_rate,
                    'ask' => $UsdAsk * $moneyRate->exc_rate,
                    'bid' => $UedBid * $moneyRate->exc_rate,
                    'price_gram_24k' => $p_24_AED,
                    'price_gram_22k' => $p_22_AED,
                    'price_gram_21k' => $p_21k * $moneyRate->exc_rate,
                    'price_gram_20k' => $p_20k * $moneyRate->exc_rate,
                    'price_gram_18k' => $p_18k * $moneyRate->exc_rate,
                    'price_gram_16k' => $p_16k * $moneyRate->exc_rate,
                    'price_gram_14k' => $p_14k * $moneyRate->exc_rate,
                    'price_gram_10k' => $p_10k * $moneyRate->exc_rate,
                    'TTB' => $p_TTB_AED,
                    'KB995' => $p_KB995 * $moneyRate->exc_rate,
                    'KB999' => $p_KB999 * $moneyRate->exc_rate,
                ]

            ];
        }
    }
}
