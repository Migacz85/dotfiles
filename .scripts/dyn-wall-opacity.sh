#!/bin/bash

DIR='/home/migacz/Downloads/big-sur2'

while [ true ]
do 

    h=$(date +"%H")
    h_1=$(date -d 'today +1 hour' +"%H")
    m=$(date +"%M")
    
    # Manual testing
    # m=59
    # h='11'
    # h_1='12'

    #remove first string from var if 0 is on the beggining
    if [[ $h =~ ^0 ]]; then 
       h="${h:1}"
       h_1="${h_1:1}"
    fi

    if [[ $m =~ ^0 ]]; then 
       m="${m:1}"
    fi

    if [[ $m == 0 ]]; then 
       m=1
    fi


    opacity=$(bc <<<$m*1.6)
    opacity=$(echo "$opacity" | cut -d "." -f 1)

    if [[ $opacity == 0 ]]; then
        opacity = 1
    fi 

    mod=$(($m%5)) 

    if [[ $mod -eq 0 ]]; then
    echo "pic" $h
    echo "pic2" $h_1
    echo "Percent opacity: $opacity "
    #variable around set is oscilating from 2 to 120. Max should be 100 
    convert $DIR/$h.jpg $DIR/$h_1.jpg -geometry 6016x6016 -alpha set -channel a -evaluate set $opacity% +channel -gravity center -compose over -composite $DIR/wall$m.jpg
    echo $m
        
    feh --bg-fill "$DIR/wall$m.jpg"

        # set wallpaper in kde
        setkde() {
        qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
        var allDesktops = desktops();
        print (allDesktops);
        for (i=0;i<allDesktops.length;i++) {
            d = allDesktops[i];
            d.wallpaperPlugin = 'org.kde.image';
            d.currentConfigGroup = Array('Wallpaper',
                                        'org.kde.image',
                                        'General');
            d.writeConfig('Image', 'file://"$1"')
        }"
        }

      setkde "/home/migacz/Downloads/big-sur2/wall$m.jpg"

    fi

sleep 60

done

