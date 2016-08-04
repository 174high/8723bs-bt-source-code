#!/bin/bash
for((i=1;i<30;i++))
do
    echo "try the $i time"
    var2=`ps -A | grep "rtk_hciattach" | cut -c 2-5`
    sudo kill -9 $var2
    sudo rmmod enable_rtl8723bs_bt
    sudo insmod /home/k/8723bs-bt-source-code/enable_bt/enable_rtl8723bs_bt.ko
    sudo rtk_hciattach -n -s 115200 ttyS4 rtk_h5 > hciattach.txt 2>&1 &
    sleep 5
    var1=`hciconfig -a| grep "Manufacturer"`
    if [ -z "$var1" ] ; then
        echo "start BT failed"
    else
        break
    fi
done
