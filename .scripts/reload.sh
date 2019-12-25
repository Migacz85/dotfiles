#!/bin/bash
#
# xprop - find the windows name + additional information about windows name
# xdotool search --name 'Recipify me - Chromium'  - find window id with specific name
# xdotool getwindowfocus   - use that with id to activate window

MYWINDOW=$(xdotool getactivewindow)
echo ${MYWINDOW}

xdotool search --name 'Recipify me - Chromium'  windowactivate --sync 

sleep 0.5

xdotool key --clearmodifiers ctrl+r KP_Enter
xdotool windowactivate --sync ${MYWINDOW}
