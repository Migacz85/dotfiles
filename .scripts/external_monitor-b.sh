#!/bin/bash
############################################################
# This script is working in the following way:
# First run of script: Display only laptop 
# Second run of script: Display on laptop and external monitor
# Third run of script: Display only on external monitor
############################################################

# Check what your system have, you can check output using shell command xrandr
EXTERNAL_OUTPUT="HDMI1"
INTERNAL_OUTPUT="eDP1"

second_display="$EXTERNAL_OUTPUT"
laptop_display="$INTERNAL_OUTPUT"

#If you have monitor with 1440p resolution:
xrandr --newmode "2560x1440_50.00"  256.25  2560 2736 3008 3456  1440 1443 1448 1484 +hsync +vsync && xrandr --addmode "$second_display" "2560x1440_50.00" && xrandr --output $second_display --mode 2560x1440_50.00 && xrandr --output "$laptop_display" --mode 1920x1080 --pos 320x1440 --rotate normal
xrandr --output "$second_display" --primary --mode 2560x1440_50.00 --pos 0xffffffffffffffff --rotate normal --output VIRTUAL1 --off --output "$laptop_display" --mode 1920x1080 --pos 344x1440 --rotate normal
xrandr --dpi 110
xrandr --newmode "2560x1440_50.00"  256.25  2560 2736 3008 3456  1440 1443 1448 1484 +hsync +vsync && xrandr --addmode "$second_display" 2560x1440_50.00 && xrandr --output "$second_display" --mode "2560x1440_50.00" && xrandr --output "$laptop_display" --mode 1920x1080 --pos 320x1440 --rotate normal

# If we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="all"

# Otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

# Only monitor
if [ $monitor_mode = "all" ]; then
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --mode 2560x1440_50.00 --pos 0x0 --rotate normal 
# Only laptop
elif [ $monitor_mode = "EXTERNAL" ]; then
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
# Both        
# elif [ $monitor_mode = "INTERNAL" ]; then  # screen is not using full 1440p space
#         monitor_mode="CLONES"
#         xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --mode 2560x1440_50.00 --pos 0x0 --rotate normal #--auto --same-as $INTERNAL_OUTPUT

else
        monitor_mode="all"
        xrandr --output $EXTERNAL_OUTPUT --mode 2560x1440_50.00 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output $INTERNAL_OUTPUT --primary --mode 1920x1080 --pos 288x1440 --rotate normal
        #xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
fi
echo "${monitor_mode}" > /tmp/monitor_mode.dat
