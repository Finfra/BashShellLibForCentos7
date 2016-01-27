#!/bin/bash
#
# Copyright (c) 2003-2016 finfra.com <nowage@gmail.com>
#
# Source from : https://github.com/Finfra/BashShellLibForCentos7.git
#
lip=$1
if [ ${#lip} -eq 0 ];then
	lip=101
elif [ $lip -lt 3 ]; then
	echo 'Can Not use this local-ip.use 3~254'
	exit 1
fi

eth=`nmcli connection show|grep ethernet|awk '{print $1}'`
nmcli con mod $eth ipv4.method auto
nmcli con mod $eth ipv4.gateway ""
nmcli con mod $eth ipv4.addresses ""
nmcli con down $eth
nmcli con up $eth

subnet=`ip addr|grep "inet\ "|grep $eth|awk '{print $2}'|awk 'BEGIN{FS="."}{print $1"."$2"."$3}'`

nmcli con up $eth
nmcli con mod $eth ipv4.dns "168.126.63.1 8.8.8.8"
#echo nmcli con mod $eth ipv4.gateway "$subnet.2"
nmcli con mod $eth ipv4.addresses "$subnet.$lip/24"
#echo nmcli con mod $eth ipv4.addresses "$subnet.$lip/24"
nmcli con mod $eth ipv4.gateway "$subnet.2"
#echo nmcli con mod $eth ipv4.gateway "$subnet.2"
nmcli con mod $eth ipv4.method "manual"
nmcli con down $eth
nmcli con up $eth

echo '----------------------------------------------------------------------'
echo Ip Address is `ip addr|grep "inet\ "|grep $eth|awk '{print  $2}'`
echo '----------------------------------------------------------------------'
