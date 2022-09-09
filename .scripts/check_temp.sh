#!/usr/bin/env bash

# discharge=$(tlp-stat -b | grep poer_now | awk '{print $3}') 
discharge=$(($(cat /sys/class/power_supply/BAT0/power_now ) / 1000000))

# while [ true ]
# do 
        # redshift=$(cat /tmp/redshift_temperature.dat)
        # discharge=$(($(cat /sys/class/power_supply/BAT0/power_now) / 1000000))
        tctl=$(sensors | grep "Tctl:" | awk '{print $2}')
        brightness=$(cat /sys/class/backlight/amdgpu_bl0/brightness)
        brightness=$(printf %.0f $(echo "$brightness/255*100 " | bc -l))
        memory=$( free -h | awk '/^Mem:/ {print $3 "/" $2}' | head )
        # hdd=$( df -h | awk '/nvme1n1p4/ {print $4}')
        most_intensive_proces=$(ps axch -o cmd:7 --sort=-%cpu | head -n 1)
        temp=$(curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16- | head -2 | xargs echo)
        


        # echo "$memory $most_intensive_proces"
        #�$hdd 🔋$discharge 💡$brightness 🔥$tctl 
        export $hdd
        export $discharge
        export $brightness
        export $tctl

        if  [[ $(tlp-stat -b | grep power_now | awk '{print $3}') != '' ]]; then
            echo "🧠$memory ☁️$temp" > /home/migacz/temp

        fi

    sleep 2

# done

