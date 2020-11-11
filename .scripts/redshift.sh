#!/bin/bash

# This is a script for controling redshift 
# It's need to be bind to some key shourtcat
# So you can increase or decrese blu light by some value

# redshift.sh inc 100 - this command will increase temperature by 100

# example for binding in i3: 
# bindsym $Mod+3 exec redshift.sh dec 100

# if we don't have a file, start at 5000 
if [ ! -f "/tmp/redshift_temperature.dat" ] ; then
  temperature="5000"

# otherwise read the value from the file
else
  temperature=`cat /tmp/redshift_temperature.dat`
fi
step=$2

# redshift -x

if [ $1 == "inc" ] &&  [ $temperature -lt 25000 ]; then
echo $((temperature + step )) | bc > /tmp/redshift_temperature.dat
redshift -P -O $((temperature + step )) 
fi

if [ $1 == "dec" ] &&  [ $temperature -gt 1000 ]; then
echo $((temperature - step )) | bc > /tmp/redshift_temperature.dat
redshift -P -O $((temperature - step )) 
fi

