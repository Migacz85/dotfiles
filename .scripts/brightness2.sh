#!/bin/bash

if [ "$1" == "dec" ]; then
brillo -u 10000 -U 5
fi

if [ "$1" == "inc" ]; then
  brillo -u 10000 -A 5 
fi

BRIGHTNESS=$(cat /sys/class/backlight/amdgpu_bl0/brightness) &&
BRIGHTNESS=$(printf %.0f $(echo "$BRIGHTNESS/255*100 " | bc -l)) &&
echo $BRIGHTNESS

notify-send.py a --hint boolean:deadd-notification-center:true \
               string:type:clearPopups

# temp=$(curl -Ss 'https://wttr.in?0&T&Q' | cut -c 16- | head -2 | xargs echo  ) 
# discharge=$(( $(cat /sys/class/power_supply/BAT0/power_now) / 1000000 )) 
# tctl=$(sensors | grep "Tctl:" | awk '{print $2}'  ) 
# acpi=$(acpi | awk ' {print $9 ,$5}'  ) 
# bat=$(acpi | awk ' {print $9 ,$4}' ) 

kill -15 $pid

# notify-send.py -a "Media-control" "Brightness" "💡$BRIGHTNESS/100 "  \
#                          --hint string:image-path: boolean:transient:true \
#                          int:has-percentage:$BRIGHTNESS \
#                          --replaces-process "media-control" &

# notify-send.py -a "Media-control" "Brightness" "💡<b> $BRIGHTNESS/100 </b>\n         \n🔋$bat \n🔋 $discharge v \n🔋$acpi left                    🔥$tctl"  \
#                          --hint string:image-path: boolean:transient:true \
#                          int:has-percentage:$BRIGHTNESS \
#                          --replaces-process "media-control" 

notify-send.py -a "Media-control" "Brightness" "💡<b> $BRIGHTNESS/100 </b>\n "  \
                         --hint string:image-path: boolean:transient:true \
                         int:has-percentage:$BRIGHTNESS \
                         --replaces-process "media-control" 

/tmp/brightness.pid

echo $! > /tmp/bright.pid
pid=$(cat /tmp/bright.pid)
sleep 1
kill -15 $pid
