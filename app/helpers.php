<?php

function unit()
{
    return [
        '桶' => '桶',
        '包' => '包',
        '车' => '车'
    ];
}

function bigNumber($number, $scale = 5)
{
    return new \Moontoast\Math\BigNumber($number, $scale);
}

/**
 * 付款方式
 * @return string[]
 */
function paymentMethod()
{
    return [
        'ALIPAY'               => '支付宝',
        'WECHATPAY'            => '微信',
        'TRANSFER'             => '对公转账',
        'TO_THE_PUBLIC_TICKET' => '对公电票',
        'PUBLIC_TICKET'        => '对公纸票',
        'PRIVATE_TRANSFER'     => '对私转账',
    ];
}


//判断是否为奇数的方法
function odd($num) {
    //判断是否为整数
    if (floor($num) == $num) {
        //如果是奇数会返回true
        return $num % 2;
    } else {
        return false;
    }
}

//判断是否为偶数的方法
function even($num) {
    //判断是否为整数
    if (floor($num) == $num) {
        //如果是偶数则取反会返回true
        return !($num % 2);
    } else {
        return false;
    }
}
