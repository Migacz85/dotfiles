#!/bin/bash
# Calling this script will place minified currently focused window in corners
# of screen
# dependency: xdotool
LAPTOP_MONTIOR='eDP-1-1'
CURRENT_MONITOR=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).output' | cut -d"\"" -f2)

SaveSetting() {
    echo "CurrentPosition=$CurrentPosition
    resolution=$resolution
    size=$size
    floating=$floating
        " > ~/.scripts/mini-window/mwindow.set
}

    is_terminal_visible=$(xdotool search --name --onlyvisible ^terminal0$)
    if [[ ! -z $is_terminal_visible ]]; then
        # If there is terminal 0 open preffer to till with this window
        i3-msg [title=^terminal5$] focus
        i3-msg [title=^terminal4$] focus
        i3-msg [title=^terminal3$] focus
        i3-msg [title=^terminal2$] focus
        i3-msg [title=^terminal1$] focus
        i3-msg [title=^terminal0$] focus
        i3-msg [instance=^gl$] move workspace current
        # i3-msg [instance=^gl$] resize set 500 0
        i3-msg [instance=^gl$] split h
    else
        echo "nomatch"
        i3-msg [instance=^gl$] move workspace current
        i3-msg [instance=^gl$] split h
    fi


# Double check - Run only on mpv
# i3-msg [class="firefox"] focus
current_window_class=$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) WM_CLASS )

# if [[ $current_window_class == 'WM_CLASS(STRING) = "gl", "mpv"' ]]; then

    #Load config
    source mwindow.set
    i3-msg "fullscreen disable"

    if [[ $1 == "size" ]]; then
        # i3-msg [class="mpv"] focus
        # Set window window position to next corner
        size=$(( $size-1 ))
        SaveSetting
        if [[ $size < 2 ]]; then
            size=7
        fi
        SaveSetting
    fi

    if [[ "$1" == "youtube" ]]; then
        chromium --app=http://youtube.com
    fi

    if [[ "$1" == "netflix" ]]; then
        google-chrome-stable --app=http://netflix.com
    fi


    if [[ "$1" == "floating-toggle" ]]; then
        if [ $floating == 0 ]; then
            # i3-msg [class="mpv"] focus
            i3-msg "floating enable"
            i3-msg "sticky enable"
            # i3-msg workspace back_and_forth
            floating=1
            SaveSetting
        else
            # i3-msg [class="mpv"] focus
            i3-msg "floating disable"
            i3-msg "sticky disable"
            floating=0
            SaveSetting
        fi
    fi

    i3-msg [class="mpv"] focus

    unset x y w h
    eval $(xwininfo -id $(xdotool getactivewindow) |
        sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
            -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
            -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
            -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )
    echo -n "$x $y $w $h"
    # current selected window
    current=$(xdotool getwindowfocus)
    # The window will take up no more than a third of the width or height of the screen.
    newWindowWidth=$(($(xdotool getdisplaygeometry | awk '{print $2}') / $size ))
    newWindowHeight=$(($(xdotool getdisplaygeometry | awk '{print $1}') / $size ))
    # resize the windows with new sizes
    # xdotool windowsize $(xdotool getwindowfocus) $newWindowHeight $newWindowWidth
    # selected window size
    windowHeight=$(xdotool getwindowgeometry $current | grep Geometry | sed -e 's/x/ /g' | awk '{print $3}')
    windowWidth=$(xdotool getwindowgeometry $current | grep Geometry | sed -e 's/x/ /g' | awk '{print $2}')
    height=$(($(xdotool getdisplaygeometry | awk '{print $2}') - windowHeight ))
    width=$(($(xdotool getdisplaygeometry | awk '{print $1}') - windowWidth ))
    # xdotool windowmove $current $width $height
    LINE=`xrandr -q | grep Screen`
    WIDTH=`echo ${LINE} | awk '{ print $8 }'`
    HEIGHT=`echo ${LINE} | awk '{ print $10 }' | awk -F"," '{ print $1 }'`
    X=$((WIDTH/4))
    Y=$((HEIGHT/4))

    # CHANGE SETTINGS
    # Resolution
    #TODO detect resolution of screen where script is executed
    if [[ $1 == r ]] && [[ $2 == "qhd" ]]; then
        resolution="qhd"
        SaveSetting
    fi

    if [[ $LAPTOP_MONITOR != $SYSTEM_MONITOR ]]; then
        resolution="qhd-rotated"
        SaveSetting
    fi

    if [[ $LAPTOP_MONITOR == $SYSTEM_MONITOR ]]; then
        resolution="fhd"
        SaveSetting
    fi



    if [[ $resolution == "fhd" ]]; then
        WIDTH=1920
        HEIGHT=1080
    fi

    if [[ $resolution == "qhd" ]]; then
        WIDTH=2560
        HEIGHT=1440
    fi

    if [[ $resolution == "qhd-rotated" ]]; then
        HEIGHT=2550
        WEIGHT=2250
    fi


    if [[ $1 == "p" ]]; then # Set window position to given parameter 1, 2, 3 or 4
        CurrentPosition=$2
        SaveSetting
    fi

    if [[ $1 == "next" ]]; then
        # Set window window position to next corner
        CurrentPosition=$(( $CurrentPosition+1 ))
        SaveSetting
        if [[ $CurrentPosition > 4 ]]; then
            CurrentPosition=1
            SaveSetting
        fi
    fi

    source mwindow.set

    #SET POSITION OF WINDOW

    RIGHT=$(($WIDTH-$newWindowHeight-20))
    EXTRAMARGIN=100
    BOTTOM=$(($HEIGHT-$newWindowWidth-40 ))


    i3-msg [class="mpv"] focus
    current_window_class=$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) WM_CLASS )
    if [[ $current_window_class == 'WM_CLASS(STRING) = "gl", "mpv"' ]]; then

        if [[ $floating == 1 ]]; then
            i3-msg "floating enable"
            i3-msg "sticky enable"
        else
            i3-msg "floating disable"
            i3-msg "sticky disable"
            # i3-msg move container to workspace number 10
        fi
    fi

    # left top on rotated qhd
    # xdotool windowmove 56623106 1930 10
    # right top
    # xdotool windowmove 56623106 2870 10
    # right down
    # xdotool windowmove 56623106 2850 2250
    # left down
    # xdotool windowmove 56623106 1930 2250


    if [[ $CurrentPosition == 1 ]]; then
        xdotool windowmove $current $RIGHT 20
    fi
    if [[ $CurrentPosition == 2 ]]; then
        xdotool windowmove $current $RIGHT $BOTTOM
    fi
    if [[ $CurrentPosition == 3 ]]; then
        xdotool windowmove $current  20 $BOTTOM
    fi
    if [[ $CurrentPosition == 4 ]]; then
        xdotool windowmove $current 20 20
    fi

    xdotool windowsize $(xdotool getwindowfocus) $newWindowHeight $newWindowWidth

    #After moving the mini-window remove focus from it
    # sleep 1
    i3-msg focus mode_toggle
