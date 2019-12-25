#!/bin/bash
#This script will automaticly rotate your screen and change correctly touches from the screen.
#Before running the script:
#go to https://github.com/hadess/iio-sensor-proxy and and follow all steps to install the code.
#find your TOUCHPAD, and TRANSFORM, variables. You can find them using
#typing in terminal:
#xinput list
#tested on hp x360 13s-s150sa, manjaro kde

#Update this according to output form command: xinput list
TOUCHPAD="ELAN Touchscreen"
TOUCHPAD=12

TRANSFORM='Coordinate Transformation Matrix'

monitor-sensor | while read line
do
    if [[ $line =~ .*left.* ]]
        then
            xrandr -o left | xinput set-prop "$TOUCHPAD"    "$TRANSFORM" 0 -1 1 1 0 0 0 0 1
    fi

    if [[ $line =~ .*right.* ]]
        then
            xrandr -o right | xinput set-prop "$TOUCHPAD"    "$TRANSFORM" 0 1 0 -1 0 1 0 0 1
    fi

    if [[ $line =~ .*bottom-up.* ]]
        then
            xrandr -o inverted | xinput set-prop "$TOUCHPAD"    "$TRANSFORM" -1 0 1 0 -1 1 0 0 1
    fi

    if [[ $line =~ .*normal.* ]]

        then
            xrandr -o normal | xinput set-prop "$TOUCHPAD"    "$TRANSFORM" 1 0 0 0 1 0 0 0 1
    fi
done
