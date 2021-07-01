#!/bin/bash
sleep 0.1

i3-msg [class='qutebrowser'] focus && 
xdotool type :buffer && 
xdotool key space && 
xdotool type youtube.com && 
xdotool key Return


