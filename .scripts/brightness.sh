#!/usr/bin/env bash

set -euo pipefail

brightness=$(cat /sys/class/backlight/amdgpu_bl0/brightness) &&
BRIGHTNESS=$(printf %.0f $(echo "$brightness/255*100 " | bc -l)) &&

# notify-send -a 'Brightness' "$brightness"  -h string:x-canonical-private-synchronous:anything
# notify-send -a 'Brightness' "$brightness"  -h string:x-canonical-private-synchronous:anything

NOTI_ID=$(notify-send.py "Brightness" "$BRIGHTNESS/100" \
                         --hint string:image-path boolean:transient:true \
                                int:has-percentage:$BRIGHTNESS \
                         --replaces-process "brightness-popup")

sleep 1
notify-send.py -a --hint boolean:deadd-notification-center:true string:type:clearPopups