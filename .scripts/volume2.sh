#!/bin/bash

volume=$(awk -F'[][]' '{ print $2 }' <(amixer sget Master) | awk 'END{print}') &&
volume=${volume::-1}
echo $volume


if [ "$1" == "inc" ]; then
   pulseaudio-ctl up
fi
if [ "$1" == "dec" ]; then
   pulseaudio-ctl down
fi
if [ "$1" == "mute" ]; then
   amixer -q sset Master toggle
fi


pid=$(cat /tmp/volume.pid)

#this need to be executed at least once wihtout killing and then kill need to be
#executed every time for this to work properly. This is probably deadd-notification-center bug


## With icon
# if [[ "$volume" -le 20 ]]; then
#     ICON=audio-volume-low
# else if [[ "$volume" -le 60 ]]; then
#          ICON=audio-volume-medium
#      else 
#          ICON=audio-volume-high
#      fi
# fi
# if [  $volume == 0 ]; then
#     ICON=audio-volume-muted
# fi 
# notify-send.py "Audio" "$volume/100" \
#                          --hint string:image-path:$ICON boolean:transient:true \
#                          int:has-percentage:$volume \
#                          --replaces-process "volume-popup"

notify-send.py a --hint boolean:deadd-notification-center:true \
               string:type:clearPopups


kill -15 $pid
notify-send.py -a "Media-control" "Volume" "$volume/150" \
                         --hint string:image-path: boolean:transient:true \
                         int:has-percentage:$volume \
                         --replaces-process "media-control" &

echo $! > /tmp/volume.pid
pid=$(cat /tmp/volume.pid)
sleep 1
kill -15 $pid

#grap the pid of last command to kill it next time
cat /tmp/volume.pid
