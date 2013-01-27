#设置外网接口
 dev=wan
 #取得文件进行计算
 wget http://chnroutes.googlecode.com/files/routes.txt -q -O - |awk '{print $2,$3}' |while read line;
do
ipcalc $line |grep -oP '\d+\.\d+\.\d+\.\d+\/\d{1,2}'
done |awk  -v dev=$dev '{print "ip route add dst-address="$1" gateway="dev}'

