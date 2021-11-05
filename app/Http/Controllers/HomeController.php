<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use Illuminate\Http\Request;

class HomeController extends Controller
{

    public function asd($idcard)
    {
       $data =  '{"menuNetType":"132_2002","limitInterface":"1","invalidat":"2021-11-05 17:07:02","showFlower":"0","t3_token":"95d459c62f1309f41ec98c802349bf48","keyVersion":"1","broadType":"06","default":"035103402384","filename":"","pwd":"n1VneQG4xhq3q60Bv4y9FYuzxrScd26yZ2qhg6g0tNfwhQhNtXtQtPKBZfiZlFWilNq1PA7sx5KZ1tQDay4yrjk87WlEvDd8zai8WbEikbDo2c\/G6qMU46j9LabJX0r9Fexrjj\/Fnb2uOaAOii\/NRketE\/TlqARgS1venmsMgM8=","desmobile":"035103402384","head_img":"","appId":"3f31e4f31439ef1c9288878871f9b2c21e48af576a98e72b8ebfbc6bf70a15b48f6f61384bfa050e8fd378285f669a7e89dd951e5837d0ad42b58a8aa0fb5ed1","token_online":"d81bbc9bad7cc714d8a0de6bda4debde3647f061f924deca8830b80d93cba91008455868fd33913a31b63b7cd68a42039d9e7cefb155905e7d3348b6c66300ea8f65482acfe8a34bc2429109c7ec3d58b083e7c7edc3962b51a5f5b4d8d3976d8b20a0ee11000663c09562b3e6e17e39495be03f8bc05f283518e0670dec43e5fb5fa426b1403419b4564706a66ac5dc806e92dcfe8124cbe1c2f64967091fae3e4336d020e78ff982ffda3618643bf09c9174ea2b04852aa548661d20e981bc5e201fe11655a6252eee826de37e741d8c5c8b034807ab1bd3a10c6f246b24b70fda680a2c1ca5d093654aa47169d79f413310ddbfe5cf8a7237deae4ebb95de24a77ae6fc8f3c24f773427833593287b7cefe139aae01361305e9bab5abbd209d62559cbde73addb4aaf62991909e17c45308659b0b237e2b5f85d6786be89b","ecs_token":"eyJkYXRhIjoiNWVjMzc1MzNjZDhiYmJhZTEwYWQ1NDMzYjIyNDJkODdmYzdlNWEyNzM2ZGI2MGE0YTI3NWUzZjE0NWJhYTIwOTg2NjcxMzhjYjFiNzY5OTA5NjJhN2U4MDhlOTg4NjA0YmQyNWYzMWViNmNkMTJmZWM5MzVhZTZlNGU2MzdmMDU1MzAxNWM0ODBhZTNkOWFkZWMxN2E0MzE3Yjc3NGE4NTJhZTRmOTIwMDBhNzA3NzEyNzcwMmM4ZDE3MWJmYzk2OGFhZTBiYTNkM2VjZDY1MzBjZTNjZTAxZDU0MDljOWMiLCJ2ZXJzaW9uIjoiMDAifQ==","aha":"4f0c97ba35f774933aa6e5fca9131800d6dd27e0748637f58d9c1fc96f418a46d417ba367bd5e3766b3fe2a983eceabf","pwdType":"03","code":"0","menuurl":"http:\/\/m.client.10010.com:80\/mobileService\/templates\/sitemap\/","main_member_flag":"1","list":[{"proCode":"019","area_code":"0351","num":"035103402384","cityCode":"190","proName":"山西","cityName":"太原","type":"03"}],"type":"03"}';

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
                    'dataId' => str_replace('\'', '', $button_info[0]),
                    'mobile' => urldecode(str_replace('\'', '', $button_info[1])), //accountId
                    'addressType' => str_replace('\'', '', $button_info[2]),
                    'broadType' => str_replace('\'', '', $button_info[3]),
                    'password' => urldecode($vcode[1][0]), //vcode
                    'cityCode' => $city[1][0],
                    'timestamp' => date('YmdHis', time()),
                    'pip' => '192.168.31.'.random_int(0, 254),
                ];

                $form_params = [
                    'isRemberPwd' => true,
                    'deviceId' => 750020351116000,
                    'password' => $data[$key]['password'],
                    'netWay' => 'Wifi',
                    'userType' => '03',
                    'mobile' => $data[$key]['mobile'],
                    'broadType' => $data[$key]['broadType'],
                    'pwdType' => '03',
                    'timestamp' => $data[$key]['timestamp'],
                    'appId' => '3f31e4f31439ef1c9288878871f9b2c21e48af576a98e72b8ebfbc6bf70a15b48f6f61384bfa050e8fd378285f669a7e89dd951e5837d0ad42b58a8aa0fb5ed1',
                    'keyVersion' => '',
                    'deviceBrand' => 'LGE',
                    'pip' => $data[$key]['pip'],
                    'areaCode' => $data[$key]['cityCode'],
                    'provinceChanel' => 'general',
                    'version' => 'android@8.0201',
                    'deviceModel' => 'Nexus 5',
                    'deviceOS' => 'android8.0',
                    'deviceCode' => '750020351116000',
                ];
                $client = new Client();
                $login = $client->request('POST', 'https://m.client.10010.com/mobileService/login.htm', [
                    'form_params' => $form_params
                ]);
                dd(json_decode($login->getBody()->getContents(), true));

            }


            dd($data);
        }else{
            echo '该用户当日受限制';
        }


    }
}
