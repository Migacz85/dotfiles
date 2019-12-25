#!/bin/bash
# This script is producing gifs from selected images is strongly connetected with
# ranger configuration file

rm /home/migacz/final.gif
echo "scaling pictures" 
convert -delay 20 -limit memory 1 -limit map 1 "$@" /home/migacz/final.gif
echo "compressing" 
#convert -limit memory 1 -limit map 1 /home/migacz/final.gif -fuzz 10% -layers Optimize /home/migacz/final_optimzed.gif
#echo "another compression..."
gifsicle --resize 512x --colors 512 /home/migacz/final.gif > /home/migacz/smaller.gif
echo "done! yey!"
read  -n 1 -p "Input Selection:" mainmenuinput
#file`ls file* | wc -l`.gif new file name1 name2 etc
#for photos in *.jpg ; do convert -verbose $photos -quality 85% -resize 1600x900 opt/$photos-opt.jpg ; done
