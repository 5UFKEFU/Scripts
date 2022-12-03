#!/bin/bash

phppage="http://0/php.php"
sendEmail="/www/movie_box/crontab_scripts/sendEmail"
sendTo="iammecn@qq.com"
#钉钉要发送的报警群组
dingding="9d77a5bf76e00eb8f008929458fe537c8cd8d94086ada26710afa41495bcbb52"
date=`date +%Y-%m-%d`
if [ ! -d "/logs/php-fpmrestart" ];then
        mkdir /logs/php-fpmrestart
fi
date_log=/logs/php-fpmrestart/`hostname`_php-fpm_restart.log."$date"
php_fpm_restart()
{

if [ `netstat -anpo | grep "php-fpm" | wc -l` -eq 0 ]; then
        echo "`date +%Y%m%d-%H:%M` restart `hostname`-php-fpm" >> $date_log
        /etc/init.d/php-fpm start
                service nginx restart 
        echo "php-fpm start" >> $date_log
else
        killall -9 php-fpm
        sleep 1
        /etc/init.d/php-fpm start
                service nginx restart 
                echo "`date +%Y%m%d-%H:%M` restart `hostname`-php-fpm" >> $date_log
        echo "php-fpm restart" >> $date_log
fi

}



for ((j=1;j<4;j++));do

http_code=`curl -o /dev/null -s -m 10  -w %{http_code} ${phppage}| awk '{print $0}'`


if [ "$http_code" -ge 500 ]; then

        php_fpm_restart
        if [ $j == 3 ];then
                ip=`ip a | grep inet | grep -v inet6 | grep -v 127 | sed 's/^[ \t]*//g' | cut -d ' ' -f2`
                #curl -g "http://24.feng.com/index.php?r=Api/sendorder&token=6fe75a4d672bfb9d49e191ad31e31b54&webname=php 不可用&description=$ip `hostname` php连续重启超过3次&level=1" > /dev/null 2>&1
                #chmod +x  "$sendEmail"
                #$sendEmail -f alarm@mbp.pub -t $sendTo -s mail.mbp.pub   -xu alarm@mbp.pub -xp iammecn  -u " $ip `hostname` php_fpm_restart "   -m "Hi,\n The `hostname`($ip) php-fpm restart 3 times,Please check it . \n `date +%Y%m%d-%H:%M:%S` It is system auto send." 
                message="$ip php-fpm restart 3 times,Please check it . frome `hostname` "
                curl "https://oapi.dingtalk.com/robot/send?access_token=$dingding"  -H 'Content-Type: application/json'  -d "{\"msgtype\": \"text\",\"text\": {\"content\":\"scripts,$message\"}}"
                
        fi
else
        echo "`date +%Y%m%d-%H:%M:%S` php-fpm ok ~_~"
fi

sleep 1

done
