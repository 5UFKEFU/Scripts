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

if [ `hostname` == usa7-cache10 ] ; then
ifconfig eth1 192.168.101.22/24
echo "ifconfig eth1 192.168.101.22/24" >> /etc/rc.local

elif  [ `hostname` == usa7-cache11 ]; then
ifconfig eth1 192.168.101.25/24
echo "ifconfig eth1 192.168.101.25/24" >> /etc/rc.local

elif  [ `hostname` == usa7-cache12 ]; then
ifconfig eth1 192.168.101.26/24
echo "ifconfig eth1 192.168.101.26/24" >> /etc/rc.local

elif  [ `hostname` == usa7-cache13 ]; then
ifconfig eth1 192.168.101.27/24
echo "ifconfig eth1 192.168.101.27/24" >> /etc/rc.local

elif  [ `hostname` == usa7-cache14 ]; then
ifconfig eth1 192.168.101.28/24
echo "ifconfig eth1 192.168.101.28/24" >> /etc/rc.local


elif  [ `hostname` == usa7-cache1 ]; then
ifconfig eth1 192.168.101.11/24
echo "ifconfig eth1 192.168.101.11/24" >> /etc/rc.local



elif  [ `hostname` == usa7-cache4 ]; then
ifconfig eth1 192.168.101.16/24
echo "ifconfig eth1 192.168.101.16/24" >> /etc/rc.local

elif  [ `hostname` == usa7-cache5 ]; then
ifconfig eth1 192.168.101.17/24
echo "ifconfig eth1 192.168.101.17/24" >> /etc/rc.local

elif  [ `hostname` == usa7-cache6 ]; then
ifconfig eth1 192.168.101.18/24
echo "ifconfig eth1 192.168.101.18/24" >> /etc/rc.local

elif  [ `hostname` == usa7-cache7 ]; then
ifconfig eth1 192.168.101.19/24
echo "ifconfig eth1 192.168.101.19/24" >> /etc/rc.local

elif  [ `hostname` == usa7-cache8 ]; then
ifconfig eth1 192.168.101.20/24
echo "ifconfig eth1 192.168.101.20/24" >> /etc/rc.local

elif  [ `hostname` == usa7-cache9 ]; then
ifconfig eth1 192.168.101.21/24
echo "ifconfig eth1 192.168.101.21/24" >> /etc/rc.local

elif  [ `hostname` == usa6-nas01 ]; then
ifconfig eth1 192.168.101.9/24
echo "ifconfig eth1 192.168.101.9/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas01 ]; then
ifconfig eth1 192.168.101.10/24
echo "ifconfig eth1 192.168.101.10/24" >> /etc/rc.local


elif  [ `hostname` == de2-cache1 ]; then
ifconfig eth1 192.168.101.35/24
echo "ifconfig eth1 192.168.101.35/24" >> /etc/rc.local

elif  [ `hostname` == usa6-cache2 ]; then
ifconfig eth1 192.168.101.36/24
echo "ifconfig eth1 192.168.101.36/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas02 ]; then
ifconfig eth1 192.168.101.37/24
echo "ifconfig eth1 192.168.101.37/24" >> /etc/rc.local



elif  [ `hostname` == usa7-cache-s1 ]; then
ifconfig eth1 192.168.101.38/24
echo "ifconfig eth1 192.168.101.38/24" >> /etc/rc.local

elif  [ `hostname` == ca1-cache1 ]; then
ifconfig eth1 192.168.101.31/24
echo "ifconfig eth1 192.168.101.31/24" >> /etc/rc.local

elif  [ `hostname` == uk1-cache2 ]; then
ifconfig eth1 192.168.101.43/24
echo "ifconfig eth1 192.168.101.43/24" >> /etc/rc.local

elif  [ `hostname` == uk1-nas02 ]; then
ifconfig eth1 192.168.101.12/24
echo "ifconfig eth1 192.168.101.12/24" >> /etc/rc.local


elif  [ `hostname` == usa6-cache1 ]; then
ifconfig eth1 192.168.101.44/24
echo "ifconfig eth1 192.168.101.44/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas04 ]; then
ifconfig eth1 192.168.101.45/24
echo "ifconfig eth1 192.168.101.45/24" >> /etc/rc.local

elif  [ `hostname` == uk1-cache1 ]; then
ifconfig eth1 192.168.101.46/24
echo "ifconfig eth1 192.168.101.46/24" >> /etc/rc.local


elif  [ `hostname` == usa6-nas02 ]; then
ifconfig eth1 192.168.101.51/24
echo "ifconfig eth1 192.168.101.51/24" >> /etc/rc.local

elif  [ `hostname` == usa6-st202 ]; then
ifconfig eth3 192.168.101.54/24
echo "ifconfig eth3 192.168.101.54/24" >> /etc/rc.local
elif  [ `hostname` == usa6-st203 ]; then
ifconfig eth3 192.168.101.55/24
echo "ifconfig eth3 192.168.101.55/24" >> /etc/rc.local
elif  [ `hostname` == usa6-st204 ]; then
ifconfig eth3 192.168.101.56/24
echo "ifconfig eth3 192.168.101.56/24" >> /etc/rc.local


elif  [ `hostname` == usa7-st201 ]; then
      ifconfig eth3 192.168.101.57/24
echo "ifconfig eth3 192.168.101.57/24" >> /etc/rc.local

elif  [ `hostname` == usa7-st202 ]; then
      ifconfig eth3 192.168.101.58/24
echo "ifconfig eth3 192.168.101.58/24" >> /etc/rc.local

elif  [ `hostname` == usa7-st203 ]; then
      ifconfig eth3 192.168.101.59/24
echo "ifconfig eth3 192.168.101.59/24" >> /etc/rc.local

elif  [ `hostname` == usa7-st204 ]; then
      ifconfig eth3 192.168.101.60/24
echo "ifconfig eth3 192.168.101.60/24" >> /etc/rc.local

elif  [ `hostname` == usa7-st205 ]; then
      ifconfig eth3 192.168.101.61/24
echo "ifconfig eth3 192.168.101.61/24" >> /etc/rc.local

elif  [ `hostname` == usa7-st206 ]; then
      ifconfig eth3 192.168.101.62/24
echo "ifconfig eth3 192.168.101.62/24" >> /etc/rc.local


elif  [ `hostname` == usa7-nas07 ]; then
      ifconfig eth1 192.168.101.63/24
echo "ifconfig eth1 192.168.101.63/24" >> /etc/rc.local


elif  [ `hostname` == usa7-nas08 ]; then
      ifconfig eth1 192.168.101.64/24
echo "ifconfig eth1 192.168.101.64/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas09 ]; then
      ifconfig eth1 192.168.101.65/24
echo "ifconfig eth1 192.168.101.65/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas10 ]; then
      ifconfig eth1 192.168.101.66/24
echo "ifconfig eth1 192.168.101.66/24" >> /etc/rc.local

elif  [ `hostname` == usa6-nas03 ]; then


nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.67/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"


elif  [ `hostname` == usa6-nas04 ]; then
      ifconfig eth1 192.168.101.68/24
echo "ifconfig eth1 192.168.101.68/24" >> /etc/rc.local

elif  [ `hostname` == usa6-nas05 ]; then
      ifconfig eth1 192.168.101.69/24
echo "ifconfig eth1 192.168.101.69/24" >> /etc/rc.local

elif  [ `hostname` == usa6-nas06 ]; then
      ifconfig eth1 192.168.101.70/24
echo "ifconfig eth1 192.168.101.70/24" >> /etc/rc.local

elif  [ `hostname` == usa6-nas07 ]; then
      ifconfig eth1 192.168.101.71/24
echo "ifconfig eth1 192.168.101.71/24" >> /etc/rc.local

elif  [ `hostname` == usa6-nas08 ]; then
      ifconfig eth1 192.168.101.72/24
echo "ifconfig eth1 192.168.101.72/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas11 ]; then
      ifconfig eth1 192.168.101.73/24
echo "ifconfig eth1 192.168.101.73/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas12 ]; then
      ifconfig eth1 192.168.101.74/24
echo "ifconfig eth1 192.168.101.74/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas13 ]; then
      ifconfig eth1 192.168.101.75/24
echo "ifconfig eth1 192.168.101.75/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas14 ]; then
      ifconfig eth1 192.168.101.76/24
echo "ifconfig eth1 192.168.101.76/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas15 ]; then
      ifconfig eth1 192.168.101.77/24
echo "ifconfig eth1 192.168.101.77/24" >> /etc/rc.local

elif  [ `hostname` == uk1-nas03 ]; then
      ifconfig eth1 192.168.101.78/24
echo "ifconfig eth1 192.168.101.78/24" >> /etc/rc.local

elif  [ `hostname` == usa7-nas06 ]; then
      ifconfig eth1 192.168.101.79/24
echo "ifconfig eth1 192.168.101.79/24" >> /etc/rc.local

elif  [ `hostname` == uk1-nas04 ]; then
      ifconfig eth1 192.168.101.80/24
echo "ifconfig eth1 192.168.101.80/24" >> /etc/rc.local


elif  [ `hostname` == usa7-nas16 ]; then

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.82/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"


elif  [ `hostname` == usa7-nas17 ]; then

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.83/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"


elif  [ `hostname` == usa7-nas18 ]; then
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.84/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"



elif  [ `hostname` == usa7-nas19 ]; then

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.85/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"

elif  [ `hostname` == usa7-nas20 ]; then

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.81/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"







elif  [ `hostname` == uk1-nas05 ]; then

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.94/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1

elif  [ `hostname` == uk1-nas06 ]; then

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.95/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1



elif  [ `hostname` == uk3-nas01 ]; then

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.102.11/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1


elif  [ `hostname` == ca1-inf101 ]; then

ifdown Wired_connection_1
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.99/24"
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1



elif  [ `hostname` == ca1-a1g201 ]; then

ifdown Wired_connection_1
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.100/24"
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1


elif  [ `hostname` == usa7-cache15 ]; then

ifdown Wired_connection_1
ifdown Wired_connection_1
ifdown Wired_connection_1
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.101/24"
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1



elif  [ `hostname` == usa6-cache3 ]; then


ifdown Wired_connection_1
ifdown Wired_connection_1
ifdown Wired_connection_1
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.42/24"
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1






elif  [ `hostname` == usa6-cache11 ]; then


ifdown Wired_connection_1
ifdown Wired_connection_1
ifdown Wired_connection_1
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.102/24"
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1


elif  [ `hostname` == uk1-as201 ]; then


ifdown Wired_connection_1
ifdown Wired_connection_1
ifdown Wired_connection_1
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.103/24"
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1


elif  [ `hostname` == uk1-as101 ]; then


ifdown Wired_connection_1
ifdown Wired_connection_1
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.104/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1

elif  [ `hostname` == uk1-as202 ]; then



ifdown Wired_connection_1
ifdown Wired_connection_1
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.105/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1

elif  [ `hostname` == uk1-as203 ]; then



ifdown Wired_connection_1
ifdown Wired_connection_1
nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.107/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1




elif  [ `hostname` == usa7-hs101 ]; then

ifdown Wired_connection_1
ifup Wired_connection_1
ifdown Wired_connection_1

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.106/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1



elif  [ `hostname` == usa7-nas03 ]; then

ifdown Wired_connection_1
ifup Wired_connection_1
ifdown Wired_connection_1

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.39/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1


elif  [ `hostname` == usa6-cache10 ]; then

ifdown Wired_connection_1
ifup Wired_connection_1
ifdown Wired_connection_1

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.90/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1






elif  [ `hostname` == usa7-cache2 ]; then

ifdown Wired_connection_1
ifup Wired_connection_1
ifdown Wired_connection_1

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.14/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"
route add -net 192.168.0.0/16 gw 192.168.101.1





elif  [ `hostname` == uk3-nas05 ]; then

ifdown Wired_connection_1
ifup Wired_connection_1
ifdown Wired_connection_1

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.102.15/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"



elif  [ `hostname` == usa7-cache3 ]; then

ifdown Wired_connection_1
ifup Wired_connection_1
ifdown Wired_connection_1

nmcli connection modify "Wired connection 1" ipv4.method manual
nmcli connection modify  "Wired connection 1" ipv4.addresses  "192.168.101.15/24"
ifdown Wired_connection_1
nmcli connection up "Wired connection 1"



elif  [ `hostname` == usa6-cache13 ]; then

ifconfig eth3 192.168.101.109/24
echo "ifconfig eth3 192.168.101.109/24" >> /etc/rc.local


fi





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
