<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use Illuminate\Http\Request;

class HomeController extends Controller
{

    public function asd($idcard)
    {
        $a = random_int(100000, 999999);
        $originalData = $idcard.$a;
        $fp = fopen(asset('public.key'), 'r');
        $publicKey=fread($fp,8192);
        fclose($fp);

        $encryptData = '';
        openssl_public_encrypt($originalData, $encryptData, $publicKey);
        $base_url = 'https://m.client.10010.com/mobileService/login/getBroadBandInfo.htm?version=android@8.0201&idCard='.urlencode(base64_encode($encryptData)).'&cityCode=190&deviceId=359250053525746&deviceCode=359250053533745&pip=192.168.31.104&desmobile=';


        $client = new Client();

        $str = $client->get($base_url)->getBody()->getContents();
//        $str = str_replace(PHP_EOL, '', $str);

        $patt1 = '/toClient\(([\w\W]*?)\)">进入/';
        $patt2 = '/vCode=\'([\w\W]*?)\'/';
        $patt3 = '/cityCode":"([\w\W]*?)"/';

        preg_match_all($patt1, $str, $rs); //匹配accountID
        preg_match_all($patt2, $str, $vcode); //匹配vCode
        preg_match_all($patt3, $str, $city); //匹配cityCode

        $res = $rs[1];
        if($res){
            $data = [];
            foreach($res as $key=>$item){
                $button_info = explode(',', $item);
                $data[$key] = [
                    'dataId' => $button_info[0],
                    'mobile' => $button_info[1], //accountId
                    'addressType' => $button_info[2],
                    'broadType' => $button_info[3],
                    'password' => $vcode[1][0], //vcode
                    'cityCode' => $city[1][0],
                    'timestamp' => date('YmdHis', time()),
                    'pip' => '192.168.31.'.random_int(0, 254),
                ];
            }

            dd($data);
        }else{
            echo '该用户当日受限制';
        }


    }
}
