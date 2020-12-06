#!/usr/bin/env bash
while [ true ]
do 

    discharge=$(tlp-stat -b | grep power_now | awk '{print $3}') 
    tctl=$(sensors | grep "Tctl:" | awk '{print $2}')

    if  [[ $(tlp-stat -b | grep power_now | awk '{print $3}') != '' ]]; then
       echo "$tctl $discharge mW" > /home/migacz/temp
    fi

done

