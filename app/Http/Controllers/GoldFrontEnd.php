<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\ExcMoneyRate;
use App\Models\LiveRateData;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Client\RequestException;
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
                //Default Value From API
                $currencyIsoCode = $quoteData['CurrencyIsoCode'];
                $lastPriceDateTime = $quoteData['LastPriceDateTime'];     // 1925.1
                $previousClosePrice = $quoteData['PreviousClosePrice'];  // 1925.1
                $lastPrice = $quoteData['LastPrice'];                    // 1932.06
                $changeAbsolute = $quoteData['ChangeAbsolute'];            // 6.96 or -6.96
                $changePercent = $quoteData['ChangePercent'];            // 0.36 or -0.36

                // calculation:
                if ($changeAbsolute > 0 && $changePercent > 0) {
                    $UsdPrice  = $lastPrice + $changePercent;  // 1932.06 + .36 = 1932.42
                    $UsdAsk = $UsdPrice + ($changePercent * 2);  // 1932.42 + (.36*2) = 1932.78
                    $UsdBid = $UsdPrice - ($changePercent * 2);  // 1932.42 - (.36*2) = 1931.7
                    $UsdHighPrice = $UsdPrice + ($changePercent * 4); // 1932.42 + (.36*4) = 1933.86
                    $UsdLowPrice = $UsdPrice - $changeAbsolute - $changePercent; // 1932.42 - 6.96 - 0.36 = 1925.10
                } elseif ($changeAbsolute < 0 && $changePercent < 0) {
                    $UsdPrice  = $lastPrice - $changePercent;  // 1930.05 - (-.36) = 1932.42
                    $UsdAsk = $UsdPrice - ($changePercent * 2);  // 1930.31 - (-.36*2) = 1932.78
                    $UsdBid = $UsdPrice + ($changePercent * 2);  // 1930.31 + (-.36*2) = 1931.7
                    $UsdHighPrice = $UsdPrice - ($changePercent * 4); // 1932.42 - (-.36*4) = 1933.86
                    $UsdLowPrice = $UsdPrice + $changeAbsolute + $changePercent; // 1932.42 + (-6.96) + (-0.36) = 1925.10
                } else {
                    $UsdPrice  = $lastPrice;
                    $UsdAsk = $lastPrice;
                    $UsdBid = $lastPrice - 1;
                    $UsdHighPrice = $UsdAsk;
                    $UsdLowPrice = $UsdAsk;
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
                $p_KB995 = (($UsdPrice * (22 / 24)) / 31.1035) * 1000;
                $p_KB999 = (($UsdPrice * (22 / 24)) / 31.1035) * 1000;
                $p_TTB_AED = $UsdPrice * 13.7639;
                $p_24_AED = ($p_TTB_AED / 116.64) + 3.67 - 1;
                $p_22_AED = ($p_24_AED * .916);
                $p_KB995_AED = $p_22_AED * 1000;
                $p_KB999_AED = $p_24_AED * 1000;
                return [
                    [
                        'CurrencyIsoCode' => $currencyIsoCode,
                        'openTime' => $lastPriceDateTime,
                        'previousClosePrice' => $previousClosePrice,
                        'openPrice' => $previousClosePrice,
                        'lastPrice' => $lastPrice,
                        'price' => $UsdPrice,
                        'ask' => $UsdAsk,
                        'bid' => $UsdBid,
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
                        'bid' => $UsdBid * $moneyRate->exc_rate,
                        'price_gram_24k' => $p_24_AED,
                        'price_gram_22k' => $p_22_AED,
                        'price_gram_21k' => $p_21k * $moneyRate->exc_rate,
                        'price_gram_20k' => $p_20k * $moneyRate->exc_rate,
                        'price_gram_18k' => $p_18k * $moneyRate->exc_rate,
                        'price_gram_16k' => $p_16k * $moneyRate->exc_rate,
                        'price_gram_14k' => $p_14k * $moneyRate->exc_rate,
                        'price_gram_10k' => $p_10k * $moneyRate->exc_rate,
                        'TTB' => $p_TTB_AED,
                        'KB995' => $p_KB995_AED,
                        'KB999' => $p_KB999_AED,
                    ]

                ];
            }
        } else {
            // generate fake data 
            $data = $response->json();

            $quoteData = $data[0]['Quotes'][0];

            //Default Value From API
            $currencyIsoCode = $quoteData['CurrencyIsoCode'];
            $lastPriceDateTime = $quoteData['LastPriceDateTime'];     // 1925.1
            $previousClosePrice = $quoteData['PreviousClosePrice'] + lcg_value(); //1925.1
            $lastPrice = $quoteData['LastPrice'] + lcg_value();                     // 1932.06 rand(0, 1)
            $changeAbsolute = $quoteData['ChangeAbsolute'];            // 6.96 or -6.96
            $changePercent = $quoteData['ChangePercent'];            // 0.36 or -0.36


            // calculation:
            if ($changeAbsolute > 0 && $changePercent > 0) {
                $UsdPrice  = $lastPrice + $changePercent;  // 1932.06 + .36 = 1932.42
                $UsdAsk = $UsdPrice + ($changePercent * 2);  // 1932.42 + (.36*2) = 1932.78
                $UsdBid = $UsdPrice - ($changePercent * 2);  // 1932.42 - (.36*2) = 1931.7
                $UsdHighPrice = $UsdPrice + ($changePercent * 4); // 1932.42 + (.36*4) = 1933.86
                $UsdLowPrice = $UsdPrice - $changeAbsolute - $changePercent; // 1932.42 - 6.96 - 0.36 = 1925.10
            } elseif ($changeAbsolute < 0 && $changePercent < 0) {
                $UsdPrice  = $lastPrice - $changePercent;  // 1930.05 - (-.36) = 1932.42
                $UsdAsk = $UsdPrice - ($changePercent * 2);  // 1930.31 - (-.36*2) = 1932.78
                $UsdBid = $UsdPrice + ($changePercent * 2);  // 1930.31 + (-.36*2) = 1931.7
                $UsdHighPrice = $UsdPrice - ($changePercent * 4); // 1932.42 - (-.36*4) = 1933.86
                $UsdLowPrice = $UsdPrice + $changeAbsolute + $changePercent; // 1932.42 + (-6.96) + (-0.36) = 1925.10
            } else {
                $UsdPrice  = $lastPrice;
                $UsdAsk = $lastPrice;
                $UsdBid = $lastPrice - 1;
                $UsdHighPrice = $UsdAsk;
                $UsdLowPrice = $UsdAsk;
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
            $p_KB995 = (($UsdPrice * (22 / 24)) / 31.1035) * 1000;
            $p_KB999 = (($UsdPrice * (22 / 24)) / 31.1035) * 1000;
            $p_TTB_AED = $UsdPrice * 13.7639;
            $p_24_AED = ($p_TTB_AED / 116.64) + 3.67 - 1;
            $p_22_AED = ($p_24_AED * .916);
            $p_KB995_AED = $p_22_AED * 1000;
            $p_KB999_AED = $p_24_AED * 1000;
            return [
                [
                    'CurrencyIsoCode' => $currencyIsoCode,
                    'openTime' => $lastPriceDateTime,
                    'previousClosePrice' => $previousClosePrice,
                    'openPrice' => $previousClosePrice,
                    'lastPrice' => $lastPrice,
                    'price' => $UsdPrice,
                    'ask' => $UsdAsk,
                    'bid' => $UsdBid,
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
                    'bid' => $UsdBid * $moneyRate->exc_rate,
                    'price_gram_24k' => $p_24_AED,
                    'price_gram_22k' => $p_22_AED,
                    'price_gram_21k' => $p_21k * $moneyRate->exc_rate,
                    'price_gram_20k' => $p_20k * $moneyRate->exc_rate,
                    'price_gram_18k' => $p_18k * $moneyRate->exc_rate,
                    'price_gram_16k' => $p_16k * $moneyRate->exc_rate,
                    'price_gram_14k' => $p_14k * $moneyRate->exc_rate,
                    'price_gram_10k' => $p_10k * $moneyRate->exc_rate,
                    'TTB' => $p_TTB_AED,
                    'KB995' => $p_KB995_AED,
                    'KB999' => $p_KB999_AED,
                ]
            ];
        }
    }

    public function fetchBroadcastData()
    {
        $maxRetries = 3;
        try {
            retry($maxRetries, function () {
                $response = Http::get('http://bcast.apanjewellery.com:7767/VOTSBroadcastStreaming/Services/xml/GetLiveRateByTemplateID/apan', [
                    '_' => time()
                ]);
    
                $data = $response->body(); // Get the plain text data
                $rows = explode("\n", $data); // Split data into rows
    
                $result = [];
    
                foreach ($rows as $row) {
                    $columns = explode("\t", trim($row)); // Split row into columns
                    if (count($columns) >= 4) {
                        $result[] = [
                            'id' => $columns[0],
                            'type' => $columns[1],
                            'bid_sell' => $columns[2],
                            'ask_buy' => $columns[3],
                            'low' => $columns[4],
                            'high' => $columns[5]
                        ];
                    }
                }
    
                return $result;
            }, 100);
        } catch (RequestException $e) {
            // Handle the exception, log the error, and provide a user-friendly message
            Log::error('Error connecting to the server: ' . $e->getMessage());
            return response()->json(['error' => 'Could not fetch data from the server'], 500);
        }
    }

    public function showBroadcastData()
    {
        $broadcastData = $this->fetchBroadcastData();

        if (isset($broadcastData['error'])) {
            return response()->json($broadcastData, 500);
        }

        return response()->json($broadcastData);
    }

    // historical data part 
    public function type()
    {
        return [
            'GOLD OZ', 'GOLD PURE 92', 'GOLD 9999', 'TEN TOLA BAR', 'KILO BAR 995', 'KILO BAR 9999'
        ];
    }

    public function getHistoricalData(Request $request)
    {
        $type = $request->query('type', 'GOLD OZ');
        $endDate = $request->query('endDate', '2023-08-25'); // Default date
        $days = $request->query('days', 7); // Default number of days

        $historicalData = LiveRateData::select('type', 'ask_buy', 'created_at')
            ->where('type', $type)
            ->whereDate('created_at', '<=', $endDate)
            ->whereDate('created_at', '>', Carbon::parse($endDate)->subDays($days))
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json($historicalData);
    }
}
