<?php
// 获取访问者IP地址
function getUserIp() {
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}

// 使用第三方API获取IP地址的地理位置
function getGeoLocation($ip) {
    $url = "http://ip-api.com/json/{$ip}?lang=zh-CN"; // 使用ip-api.com的API来查询地理位置
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $response = curl_exec($ch);
    curl_close($ch);

    return json_decode($response, true);
}

$ip = getUserIp();
$locationData = getGeoLocation($ip);

// 输出结果
if ($locationData && $locationData['status'] === 'success') {
    echo "您的IP地址: " . $ip . "\n";
    echo "国家: " . $locationData['country'] . "\n";
    echo "地区: " . $locationData['regionName'] . "\n";
    echo "城市: " . $locationData['city'] . "\n";
    echo "ISP: " . $locationData['isp'] . "\n";
    echo "经度: " . $locationData['lon'] . "\n";
    echo "纬度: " . $locationData['lat'] . "\n";
} else {
    echo "无法获取地理位置信息。\n";
}
