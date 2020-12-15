#!/usr/bin/env bash

# discharge=$(tlp-stat -b | grep power_now | awk '{print $3}') 
discharge=$(($(cat /sys/class/power_supply/BAT0/power_now ) / 1000000))

while [ true ]
do 
        redshift=$(cat /tmp/redshift_temperature.dat)
        discharge=$(($(cat /sys/class/power_supply/BAT0/power_now) / 1000000))
        tctl=$(sensors | grep "Tctl:" | awk '{print $2}')
        brightness=$(cat /sys/class/backlight/amdgpu_bl0/brightness)
        brightness=$(printf %.0f $(echo "$brightness/255*100 " | bc -l))
        memory=$( free -h | awk '/^Mem:/ {print $3 "/" $2}' | head )
        most_intensive_proces=$(ps axch -o cmd:7 --sort=-%cpu | head -n 1)
        # echo "$memory $most_intensive_proces"

        if  [[ $(tlp-stat -b | grep power_now | awk '{print $3}') != '' ]]; then
            echo "🔥$tctl 🔋$discharge 💡$brightness 🌇$redshift 🤔$memory" > /home/migacz/temp
        fi
    sleep 2

done

