#!/usr/bin/env bash


while [ 1 ];
do
running_test="$( ps -efww | grep '[/]sync-phone.sh' )"

   if [[ ! -z $running_test ]]; then


        logsize=$(wc -c ~/sync.log | awk '{print $1}')
        sleep 120
        logsize2=$(wc -c ~/sync.log | awk '{print $1}')
        echo $logsize
        echo $logsize2

        if [[ $logsize == $logsize2 ]]; then
        killall rsync -9
        echo "killing rsync"
        fi
   else
       echo "Sync script is not running"
       killall kill_rsync -9
       exit
   fi
done
