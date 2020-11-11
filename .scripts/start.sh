#!/usr/bin/env bash
#  Before opening a program in a shell check if it's not open

source ~/.bash_profile

is_window_exist=$(xdotool search -name $1)


    if [[ ! -z $is_window_exist ]]; then
        echo "[$(date)] : this window already running $is_window_exist"
    else

    termite -t $1 -e $2
    fi

# wal -R
