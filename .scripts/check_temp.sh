#!/usr/bin/env bash
while [ true ]
do 
    echo "" >   /home/migacz/temp
    sensors | grep "Tctl:" | awk '{print $2}' > /home/migacz/temp
    echo " " >> /home/migacz/temp
    tlp-stat -b | grep power_now | awk '{print $3}' >> /home/migacz/temp
    echo "mW" >> /home/migacz/temp
    sleep 2
done

