#!/usr/bin/env bash
#toggle_telegram.sh [class] [resize x] [resize y]

is_window_exist=$(wmctrl -l | grep WhatsApp)

    if [[ ! -z $is_window_exist ]]; then
        echo "[$(date)] : this window already running $is_window_exist"
    # killall -9 telegram-desktop
    i3-msg [class=$1] focus
    i3-msg [class=$1] kill

    else

    whatsapp-for-linux
    sleep 1

    i3-msg [class=$1] focus &&
    i3-msg [class=$1] move right &&
    #If its open bring it
    i3-msg [class=$1] move right &&


    i3-msg [class=$1] resize set $2 $3
    i3-msg [class=$1] split v

fi
