#!/usr/bin/env bash
set -euo pipefail

brightness=$(cat /sys/class/backlight/amdgpu_bl0/brightness) &&
brightness=$(printf %.0f $(echo "$brightness/255*100 " | bc -l)) &&

notify-send -a 'Brightness' "$brightness"  -h string:x-canonical-private-synchronous:anything
