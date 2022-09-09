#!/bin/bash

DIR="$HOME/.wallpapers"

SaveSetting() {
    echo "Wallnumber=$1" > $HOME/.scripts/wallpaper/wallpaper.set
}

# if [[ ! -f "wallpaper.set" ]]; then
#         echo "Wallnumber=1
#         " > $HOME/.scripts/wallpaper.set
# fi


source $HOME/dotfiles/.scripts/wallpaper/wallpaper.set
if [[ $1 == 'next' ]]; then
    total_wallpapers=$(ls -p $DIR | wc -l)
        Walli=$(( $Wallnumber + 1))
        echo "wallpapers in dir $total_wallpapers"
        echo "currnet wallnumber $Wallnumber"
    if [[ $Wallnumber -lt $total_wallpapers ]]; then
        Wallnumber=$Walli
        echo "Wallnumber=$Walli" > $HOME/.scripts/wallpaper/wallpaper.set
        # SaveSetting $Walli
    else
        echo "This is last file in this dir"
        notify-send "Last wallpaper"  -h string:x-canonical-private-synchronous:my-notification
    fi
fi

if [[ $1 == 'prev' ]]; then
    total_wallpapers=$(ls -p $DIR | wc -l)
        Walli=$(( $Wallnumber - 1))
        echo "wallpapers in dir $total_wallpapers"
        echo "currnet wallnumber $Wallnumber"
        if [[ $Wallnumber -ge 1 ]]; then
        Wallnumber=$Walli
        echo "Wallnumber=$Walli" > $HOME/.scripts/wallpaper/wallpaper.set
        # SaveSetting $Walli
    else
        echo "This is first file in this dir"
        notify-send "First wallpaper"  -h string:x-canonical-private-synchronous:my-notification
    fi
fi



if [[ $1 == '-help' ]]; then
    echo "next - next wallpaper in directory"
    echo "prev - prev wallpaper in directory"
fi

# echo "Setting wallpaper number" $Wallnumber "In this directory "

bg=$(ls -p $DIR | grep -v / | sed -n $Wallnumber'p' )
feh --bg-fill "$DIR/$Wallnumber.jpg"

# echo "$DIR/$bg"
