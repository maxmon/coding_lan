#!/bin/bash

script=$(cd "$(dirname "$0")"; pwd)
ROOT=$(dirname "$script")
midpath="$ROOT/middle"
logpath="$ROOT/log"
runner="$script/brand_run.sh"

source "$script/common.sh"

mkdir -p $midpath
mkdir -p $logpath

time1=`cat $logpath/run_log |awk '{print}'`

time2=$(date '+%s')

time_val=$((($time2-$time1)/3600))

while :
do
if [ -f "$logpath/run_log" ]
then
	#超过24h没有启动
	if [ $time_val -gt 24 ]; then
	kill $(ps aux | grep 'brand_run' | awk '{print $2}')
	ps
	rm "$midpath/.lock"
	bash $runner
	fi
else
	kill $(ps aux | grep 'brand_run' | awk '{print $2}')
	rm "$midpath/.lock"
	bash $runner
fi
sleep 72000
done






