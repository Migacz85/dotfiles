#!/bin/bash
sleep 0.5
#can be done aswell by 
#xdotool search --class qutebrowser
# xdotool windowfocus PID

i3-msg [class='qutebrowser'] focus && 
xdotool key Shift+o 
xdotool type "$1"
xdotool key Return
