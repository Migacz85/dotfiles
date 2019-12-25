#!/bin/bash

DIR="$HOME/.wallpapers"

SaveSetting() {
    echo "Wallnumber=$Wallnumber
        " > $HOME/.scripts/wallpaper.set
}

# if [[ ! -f "wallpaper.set" ]]; then
#         echo "Wallnumber=1
#         " > $HOME/.scripts/wallpaper.set
# fi

source wallpaper.set

if [[ $1 == 'next' ]]; then

    wallpapers_number=$(ls -p $DIR | wc -l)

    echo $wallpapers_number
    echo $Wallnumber

    if [[ $Wallnumber -lt $wallpapers_number ]]; then
        Wallnumber=$(( $Wallnumber + 1))
        SaveSetting

    else
        echo "This is last file in this dir"
        notify-send "Last wallpaper"  -h string:x-canonical-private-synchronous:my-notification
    fi

fi

if [[ $1 == 'prev' ]]; then

    wallpapers_number=$(ls -p $DIR |  wc -l)

    if [[ $Wallnumber -gt 0 ]]; then
        Wallnumber=$(( $Wallnumber - 1))
        SaveSetting
    else
        echo "This is first file in this dir"
        notify-send "First wallpaper"  -h string:x-canonical-private-synchronous:my-notification
     fi

fi

if [[ $1 == '-help' ]]; then
    echo "next - next wallpaper in directory"
    echo "prev - prev wallpaper in directory"
fi

echo "Setting wallpaper number" $Wallnumber "In this directory "

bg=$(ls -p $DIR | grep -v / | sed -n $Wallnumber'p' )
feh --bg-fill "$DIR/$bg"
