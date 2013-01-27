#!/bin/bash

######################################################
#
#saurik
######################################################
#!/bin/bash
cd /www/apt.weiphone.com/cydia/
mkdir -p saurik
cd saurik
rm -f Packages.bz2
wget  http://apt.saurik.com/dists/tangelo-3.7/main/binary-iphoneos-arm/Packages.bz2
if [ -f Packages.bz2 ];then
        rm -f Packages  Packages.gz Release
        bzip2 -d Packages.bz2
        bzip2 -zkf Packages
        cp -p Packages p
        gzip -f Packages
        mv -f p Packages
        md5=$(md5sum Packages | cut -c -32)
        size=$(stat -c %s Packages)
        echo " $md5 $size Packages" >> rel
        md5=$(md5sum Packages.bz2 | cut -c -32)
        size=$(stat -c %s Packages.bz2)
        echo " $md5 $size Packages.bz2" >> rel
        md5=$(md5sum Packages.gz | cut -c -32)
        size=$(stat -c %s Packages.gz)
        echo " $md5 $size Packages.gz" >> rel
        echo >> rel
        cat rl rel > Release
        rm -f rel
        rm -f Release.gpg
        gpg -abs  --always-trust  --no-tty   --batch    --passphrase "leonlaiming" -r "HuangRui" -o Release.gpg Release
        filename=`grep Filename Packages  |awk '{print $2}' | sed ':a;N;s/\n/ /;ba;'`
        for name in $filename ; do
        dir=`echo $name |awk -F "/" '{print $1}'`
        if [ ! -d  "$dir" ];then
        mkdir  $dir
        fi
                if [ !  -f "$name" ]; then
                        wget   http://apt.saurik.com/$name -O $name
                fi
        done
fi
#!/bin/bash

####################################
#http://apt.bigboss.us.com/repofiles/cydia/dists/stable/main/binary-iphoneos-arm/
#
#bigboss
####################################
cd /www/apt.weiphone.com/cydia/
mkdir bigboss
cd bigboss

#rm -f Packages.bz2
killall -9 wget
sleep 2
wget   http://apt.bigboss.us.com/repofiles/cydia/dists/stable/main/binary-iphoneos-arm/Packages.bz2 -O new.bz2
if [ -f new.bz2 ];then
        rm -f Packages  Packages.gz Release  Packages.bz2
        bzip2 -d new.bz2
        mv new Packages
        bzip2 -zkf Packages
        cp -p Packages p
        gzip -f Packages
        mv -f p Packages
        md5=$(md5sum Packages | cut -c -32)
        size=$(stat -c %s Packages)
        echo " $md5 $size Packages" >> rel
        md5=$(md5sum Packages.bz2 | cut -c -32)
        size=$(stat -c %s Packages.bz2)
        echo " $md5 $size Packages.bz2" >> rel
        md5=$(md5sum Packages.gz | cut -c -32)
        size=$(stat -c %s Packages.gz)
        echo " $md5 $size Packages.gz" >> rel
        echo >> rel
        cat rl rel > Release
        rm -f rel
        rm -f Release.gpg
        gpg -abs  --always-trust  --no-tty   --batch    --passphrase "leonlaiming" -r "HuangRui" -o Release.gpg Release
gpg -abs --passphrase "nU5rEbrunute" -r "WeiPhone APT" -o Release.gpg Release
        filename=`grep Filename Packages  |awk '{print $2}' | sed ':a;N;s/\n/ /;ba;'`

        for name in $filename ; do
        dir=`echo $name |awk -F "/" '{print $1}'`
        if [ ! -d  "$dir" ];then
        mkdir  $dir
        fi
                if [ !  -f "$name" ]; then
                        wget   http://apt.bigboss.us.com/repofiles/cydia/$name -O $name
                fi
        done
fi

###################################################
#ispaziorepository
###################################################
cd /www/apt.weiphone.com/cydia/
mkdir ispazio
cd ispazio
rm -f Packages.bz2 
wget http://ispaziorepository.com/Packages.bz2
if [ -f Packages.bz2 ];then
        rm -f Packages  Packages.gz Release
        bzip2 -d Packages.bz2
        bzip2 -zkf Packages
        cp -p Packages p
        gzip -f Packages
        mv -f p Packages
        md5=$(md5sum Packages | cut -c -32)
        size=$(stat -c %s Packages)
        echo " $md5 $size Packages" >> rel
        md5=$(md5sum Packages.bz2 | cut -c -32)
        size=$(stat -c %s Packages.bz2)
        echo " $md5 $size Packages.bz2" >> rel
        md5=$(md5sum Packages.gz | cut -c -32)
        size=$(stat -c %s Packages.gz)
        echo " $md5 $size Packages.gz" >> rel
        echo >> rel
        cat rl rel > Release
        rm -f rel
        rm -f Release.gpg
#        gpg -abs  --always-trust  --no-tty   --batch    --passphrase "leonlaiming" -r "HuangRui" -o Release.gpg Release
gpg -abs --passphrase "nU5rEbrunute" -r "WeiPhone APT" -o Release.gpg Release
        filename=`grep Filename Packages  |awk '{print $2}' | sed ':a;N;s/\n/ /;ba;'`

        for name in $filename ; do
        dir=`echo $name |awk -F "/" '{print $1}'`
        if [ ! -d  "$dir" ];then
        mkdir  $dir
        fi
                if [ !  -f "$name" ]; then
                        wget -c http://ispaziorepository.com/$name -O $name
                fi
        done
fi

##################################################
#       zodttd
##################################################
cd /www/apt.weiphone.com/cydia/
mkdir zodttd
cd zodttd
rm -f Packages.bz2 
wget  http://cydia.zodttd.com/repo/cydia/dists/stable/main/binary-iphoneos-arm/Packages.bz2
if [ -f Packages.bz2 ];then
        rm -f Packages  Packages.gz Release
        bzip2 -d Packages.bz2
        bzip2 -zkf Packages
        cp -p Packages p
        gzip -f Packages
        mv -f p Packages
        md5=$(md5sum Packages | cut -c -32)
        size=$(stat -c %s Packages)
        echo " $md5 $size Packages" >> rel
        md5=$(md5sum Packages.bz2 | cut -c -32)
        size=$(stat -c %s Packages.bz2)
        echo " $md5 $size Packages.bz2" >> rel
        md5=$(md5sum Packages.gz | cut -c -32)
        size=$(stat -c %s Packages.gz)
        echo " $md5 $size Packages.gz" >> rel
        echo >> rel
        cat rl rel > Release
        rm -f rel
        rm -f Release.gpg
#        gpg -abs  --always-trust  --no-tty   --batch    --passphrase "leonlaiming" -r "HuangRui" -o Release.gpg Release
gpg -abs --passphrase "nU5rEbrunute" -r "WeiPhone APT" -o Release.gpg Release
        filename=`grep Filename Packages  |awk '{print $2}' | sed ':a;N;s/\n/ /;ba;'
        for name in $filename ; do
        dir=`echo $name |awk -F "/" '{print $1}'`
        if [ ! -d  "$dir" ];then
        mkdir  $dir
        fi
                if [ !  -f "$name" ]; then
                        wget   http://cydia.zodttd.com/repo/cydia/$name -O $name
                fi
        done
fi

######################################################
#
#modmyi
######################################################
cd /www/apt.weiphone.com/cydia/
mkdir modmyi
cd modmyi
rm -f  Packages.bz2 
wget   http://apt.modmyi.com/dists/stable/main/binary-iphoneos-arm/Packages.bz2
if [ -f Packages.bz2 ];then
        rm -f Packages  Packages.gz Release
        bzip2 -d Packages.bz2
        bzip2 -zkf Packages
        cp -p Packages p
        gzip -f Packages
        mv -f p Packages
        md5=$(md5sum Packages | cut -c -32)
        size=$(stat -c %s Packages)
        echo " $md5 $size Packages" >> rel
        md5=$(md5sum Packages.bz2 | cut -c -32)
        size=$(stat -c %s Packages.bz2)
        echo " $md5 $size Packages.bz2" >> rel
        md5=$(md5sum Packages.gz | cut -c -32)
        size=$(stat -c %s Packages.gz)
        echo " $md5 $size Packages.gz" >> rel
        echo >> rel
        cat rl rel > Release
        rm -f rel
        rm -f Release.gpg
#        gpg -abs  --always-trust  --no-tty   --batch    --passphrase "leonlaiming" -r "HuangRui" -o Release.gpg Release
gpg -abs --passphrase "nU5rEbrunute" -r "WeiPhone APT" -o Release.gpg Release
        filename=`grep Filename Packages  |awk '{print $2}' | sed ':a;N;s/\n/ /;ba;'`
        for name in $filename ; do
        dir=`echo $name |awk -F "/" '{print $1}'`
        if [ ! -d  "$dir" ];then
        mkdir  $dir
        fi
                if [ !  -f "$name" ]; then
                        mkdir -p $name
                        rm -Rfv $name
                        wget   http://apt.modmyi.com/$name -O $name
                fi
        done
fi