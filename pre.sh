#echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
#echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6

yum install lrzsz dstat vim wget php-fpm php -y  
wget -4  http://soft.thesnowtop.com/sendEmail  -O /bin/sendEmail
chmod +x /bin/sendEmail
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
export HISTTIMEFORMAT='%F %T '
cat >> /etc/bashrc <<EOF
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
export HISTTIMEFORMAT='%F %T '
EOF
#add snowtop ssh key
mkdir /root/.ssh;  echo   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDQmB+rBcM4XhnJl/ZX3gvorNiAoLhLtlYK0grS+UBLRr9kVClOPDmoomsEU4aH3lfVMW2zzvOGd+UQq28QqqkbxvrG3HmeiL7JkC+LiwVNe32ECvY5u0lmb0e0H5DSKZvWuLhXftulGms/Fvoc1DUWGgBaZV2REhifbXhWcWfoVw== skey_352630" >  /root/.ssh/authorized_keys ;chmod 600 /root/.ssh/authorized_keys


Switch off root login via ssh
sed 's/#Port 22/Port 58422/' /etc/ssh/sshd_config > /etc/ssh/sshd_config.tmp1
sed 's/MACs hmac-sha2-512,hmac-sha2-256,hmac-ripemd160/#MACs hmac-sha2-512,hmac-sha2-256,hmac-ripemd160/' /etc/ssh/sshd_config.tmp1  > /etc/ssh/sshd_config.tmp
cat /etc/ssh/sshd_config.tmp > /etc/ssh/sshd_config

rm -f /etc/ssh/sshd_config.tmp
service sshd restart



 
#Switch off root login via ssh
sed 's/#Port 22/Port 58422/' /etc/ssh/sshd_config > /etc/ssh/sshd_config.tmp
cat /etc/ssh/sshd_config.tmp > /etc/ssh/sshd_config
rm -f /etc/ssh/sshd_config.tmp
service sshd restart


###

#Switch off root login via ssh
sed 's/#Port 22/Port 58422/' /etc/ssh/sshd_config > /etc/ssh/sshd_config.tmp
cat /etc/ssh/sshd_config.tmp > /etc/ssh/sshd_config
rm -f /etc/ssh/sshd_config.tmp
service sshd restart


###snmp
yum install net-snmp  rsync -y
service snmpd start

sed 's/com2sec notConfigUser  default       public/com2sec notConfigUser  default       weiphone/'  /etc/snmp/snmpd.conf  > /etc/snmp/snmpd.conf.tmp
echo "view    all   included   .1" >> /etc/snmp/snmpd.conf.tmp
sed 's/exact  systemview/exact  all /' /etc/snmp/snmpd.conf.tmp > /etc/snmp/snmpd.conf
rm  -f /etc/snmp/snmpd.conf.tmp

chkconfig snmpd on
service snmpd restart
 
netstat -ntplu
iptables -F
echo  "iptables -F >> /etc/rc.local"
chmod +x /etc/rc.local

yum install epel-release -y








#Setup time sync
mkdir /root/scripts
touch /root/scripts/time_sync.sh
echo "/usr/sbin/ntpdate time.apple.com > /dev/null" > /root/scripts/time_sync.sh
echo "/sbin/hwclock --systohc" >> /root/scripts/time_sync.sh
chmod 755 /root/scripts/time_sync.sh
echo "1 1,13 * * * /root/scripts/time_sync.sh" > crontab_file
crontab crontab_file
rm -f crontab_file
/root/scripts/time_sync.sh



CMS_AGENT_ACCESSKEY=tWMOFUW6T0Y CMS_AGENT_SECRETKEY=xRDlG0GhT-IXfssySBjh5g ARGUS_VERSION=3.4.8 /bin/bash -c "$(curl -s http://cms-download.aliyun.com/Argus/agent_install_necs-1.2.sh)"

#wget http://soft.vpser.net/lnmp/lnmp1.5.tar.gz -cO lnmp1.5.tar.gz && tar zxf lnmp1.5.tar.gz && cd lnmp1.5 && LNMP_Auto="y" DBSelect="0" PHPSelect="5" SelectMalloc="1" ./install.sh lnmp

#chkconfig php-fpm off
#service php-fpm stop
#service nginx stop

mkdir /usr/src 
cd /usr/src
#git clone https://github.com/yaoweibin/nginx_upstream_check_module.git
#wget http://nginx.org/download/nginx-1.9.9.tar.gz
#tar xvfz nginx-1.9.9.tar.gz
#wget -O /usr/src/ngx_cache_purge-2.3.tar.gz  http://labs.frickle.com/files/ngx_cache_purge-2.3.tar.gz
#tar xvfz ngx_cache_purge-2.3.tar.gz

#cd nginx-1.9.9
#patch -p1 < ../nginx_upstream_check_module/check.patch

#./configure --prefix=/usr/local/nginx --with-http_slice_module --user=www --group=www --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module --with-http_gzip_static_module --with-http_sub_module --with-stream --with-stream_ssl_module --with-openssl=/root/lnmp1.5/src/openssl-1.0.2o --with-http_secure_link_module  --add-module=/usr/src/ngx_cache_purge-2.3   --with-ipv6
#make 
#make install
#mkdir -p /movie_box
mkdir /logs
chown -Rf www:www /movie_box
touch /movie_box/robots.txt

#curl  http://soft.thesnowtop.com/scripts/centos6-cache-nginx.conf  >  /usr/local/nginx/conf/nginx.conf

#hostname=`hostname` ; sed "s/Nginx-Cache/$hostname/"  /usr/local/nginx/conf/nginx.conf  >  /tmp/nginx.conf.tmp
#cat /tmp/nginx.conf.tmp   >  /usr/local/nginx/conf/nginx.conf

#service nginx restart

#swapoff -a

#echo "swapoff -a "  >> /etc/rc.local

hosts="192.168.101.40 uk1-nas01.shegu.net
192.168.101.12 uk1-nas02.shegu.net
192.168.101.78 uk1-nas03.shegu.net
192.168.101.80 uk1-nas04.shegu.net
192.168.101.46 uk1-cache1.shegu.net
192.168.101.94 uk1-nas05.shegu.net
192.168.101.95 uk1-nas06.shegu.net  uk1-nas06-1.shegu.net
192.168.101.103 uk1-as201.shegu.net  
192.168.101.104 uk1-as101.shegu.net  
192.168.101.105 uk1-as202.shegu.net  

192.168.101.31 ca1-cache1.shegu.net
192.168.101.99 ca1-inf101.shegu.net
192.168.101.100 ca1-a1g201.shegu.net
192.168.101.35 de2-cache1.shegu.net
192.168.101.10 usa7-nas01.shegu.net
192.168.101.37 usa7-nas02.shegu.net
192.168.101.39 usa7-nas03.shegu.net
192.168.101.45 usa7-nas04.shegu.net  usa7-nas04-1.shegu.net
192.168.101.49 usa7-nas05.shegu.net usa7-nas05-1.shegu.net
192.168.101.79 usa7-nas06.shegu.net usa7-nas06-1.shegu.net 
192.168.101.63 usa7-nas07.shegu.net
192.168.101.64 usa7-nas08.shegu.net
192.168.101.65 usa7-nas09.shegu.net usa7-nas09-1.shegu.net
192.168.101.66 usa7-nas10.shegu.net usa7-nas10-1.shegu.net
192.168.101.73 usa7-nas11.shegu.net  usa7-nas11-1.shegu.net
192.168.101.74 usa7-nas12.shegu.net usa7-nas12-1.shegu.net
192.168.101.75 usa7-nas13.shegu.net usa7-nas13-1.shegu.net
192.168.101.76 usa7-nas14.shegu.net  usa7-nas14-1.shegu.net
192.168.101.77 usa7-nas15.shegu.net
192.168.101.82 usa7-nas16.shegu.net
192.168.101.83 usa7-nas17.shegu.net
192.168.101.84 usa7-nas18.shegu.net usa7-nas18-1.shegu.net
192.168.101.85 usa7-nas19.shegu.net
192.168.101.81 usa7-nas20.shegu.net usa7-nas20-1.shegu.net
192.168.101.92 usa7-nas21.shegu.net  usa7-nas21-1.shegu.net
192.168.101.93 usa7-nas22.shegu.net usa7-nas22-1.shegu.net
192.168.101.96 usa7-nas23.shegu.net usa7-nas23-1.shegu.net
192.168.101.97 usa7-nas24.shegu.net  usa7-nas24-1.shegu.net
192.168.101.11 usa7-cache1.shegu.net
192.168.101.14 usa7-cache2.shegu.net  usa7-cache2-1.shegu.net 
192.168.101.15 usa7-cache3.shegu.net  usa7-cache3-1.shegu.net
192.168.101.16 usa7-cache4.shegu.net
192.168.101.17 usa7-cache5.shegu.net  usa7-cache5-1.shegu.net
192.168.101.18 usa7-cache6.shegu.net  usa7-cache6-1.shegu.net
192.168.101.19 usa7-cache7.shegu.net  usa7-cache7-1.shegu.net
192.168.101.20 usa7-cache8.shegu.net  
192.168.101.21 usa7-cache9.shegu.net usa7-cache9-1.shegu.net
192.168.101.22 usa7-cache10.shegu.net usa7-cache10-1.shegu.net
192.168.101.25 usa7-cache11.shegu.net  usa7-cache11-1.shegu.net
192.168.101.26 usa7-cache12.shegu.net  usa7-cache12-1.shegu.net
192.168.101.27 usa7-cache13.shegu.net  
192.168.101.28 usa7-cache14.shegu.net  usa7-cache14-1.shegu.net
192.168.101.101 usa7-cache15.shegu.net usa7-cache15-1.shegu.net
192.168.101.106  usa7-hs101.shegu.net usa7-hs101-1.shegu.net
192.168.101.9 usa6-nas01.shegu.net
192.168.101.51 usa6-nas02.shegu.net
192.168.101.67 usa6-nas03.shegu.net
192.168.101.68 usa6-nas04.shegu.net
192.168.101.69 usa6-nas05.shegu.net  usa6-nas05-1.shegu.net
192.168.101.91 usa6-nas06.shegu.net  usa6-nas06-1.shegu.net
192.168.101.98 usa6-nas07.shegu.net
192.168.101.44 usa6-cache1.shegu.net
192.168.101.42 usa6-cache3.shegu.net
192.168.101.47 usa6-cache4.shegu.net
192.168.101.48 usa6-cache5.shegu.net
192.168.101.86 usa6-cache6.shegu.net
192.168.101.87 usa6-cache7.shegu.net
192.168.101.88 usa6-cache8.shegu.net
192.168.101.89 usa6-cache9.shegu.net
192.168.101.90  usa6-cache10.shegu.net
192.168.101.102 usa6-cache11.shegu.net
192.168.101.108 usa6-cache12.shegu.net
192.168.101.109 usa6-cache13.shegu.net
192.168.101.110 usa6-cache14.shegu.net
192.168.101.111 usa6-cache15.shegu.net
192.168.101.112 usa6-cache16.shegu.net"
#hosts=`echo $hosts |sed "s| |\||g"`
IFS=$'\n'
for name in $hosts; do
echo $name
who=`echo $name | awk -F " " '{ print $2 }'| awk -F "." '{ print $1 }' `
ip=`echo $name | awk -F " " '{ print $1 }' `
echo who=$who
echo ip=$ip
echo "#################"
if  [ `hostname` == $who ]; then
##判断系统版本
if [ -f /etc/os-release ] ; then
VERSION_ID=`awk -F= '/^VERSION_ID/{print $2}' /etc/os-release | awk -F "\"" ' {print $2 } '`
else
VERSION_ID=`cat /etc/redhat-release | awk -F " " ' {print $3 } ' |awk -F 
"." ' {print $1 } '`
fi
#设置IP
if [  $VERSION_ID == 8 ] ; then
ifdown Wired_connection_1
ifup Wired_connection_1
ifdown Wired_connection_1

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "$ip/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1

elif [ $VERSION_ID == 6 ] || [ $VERSION_ID == 7 ] ; then

        if  [[ `hostname` == *st*  ]]; then
        network_card_name=eth3
        elseif
        network_card_name=eth1
        fi

      ifconfig $network_card_name $ip/24
      echo "ifconfig $network_card_name $ip/24" >> /etc/rc.local
      route add -net 192.168.0.0/16 gw 192.168.101.1

fi




fi

done




if  [[ `hostname` == *st2*  ]]; then
mkdir /ssd
mkfs.ext4 /dev/nvme0n1
mount /dev/nvme0n1  /ssd
echo "mount /dev/nvme0n1  /ssd" >> /etc/rc.local
mv /movie_box /movie_box_org ; mkdir /movie_box  ; mount --bind /movie_box_org /movie_box/ 

echo "mount --bind /movie_box_org /movie_box/ "  >> /etc/rc.local

fi

#### enable rc.local
VERSION_ID=`awk -F= '/^VERSION_ID/{print $2}' /etc/os-release | awk -F "\"" ' {print $2 } ' `

if [ $VERSION_ID == 8 ] ; then

chmod +x /etc/rc.d/rc.local

cat > /usr/lib/systemd/system/rc-local.service <<EOF


[Unit]
Description=/etc/rc.d/rc.local Compatibility
Documentation=man:systemd-rc-local-generator(8)
ConditionFileIsExecutable=/etc/rc.d/rc.local
Requires=network-online.target
After=network-online.target
 
[Service]
Type=forking
ExecStart=/etc/rc.d/rc.local start
TimeoutSec=0
RemainAfterExit=yes
GuessMainPID=no
 
[Install]
WantedBy=multi-user.target

EOF
systemctl daemon-reload
systemctl start rc-local
systemctl enable rc-local


fi




route add -net 192.168.0.0/16 gw 192.168.101.1
echo "route add -net 192.168.0.0/16 gw 192.168.101.1"  >> /etc/rc.local 





echo "OKOKOK"
