#!/bin/bash
# Make photo from camra and quit
FILE=1.jpg
FILE=${FILE%.*}_`date +%y-%m-%d--%H-%M`.${FILE#*.}
echo $FILE
avconv -f video4linux2 -s 1280x720 -i /dev/video0 -ss 0:0:2 -frames 1/media/migacz/Media/Camera/snaps/$FILE
#drive push -quiet /home/migacz/snaps/$FILE
