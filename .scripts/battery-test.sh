#!/usr/bin/env bash
#Simple script to test your battery

while true; do

    charging_state="$( upower -i $(upower -e | grep '/battery') | grep --color=never -E charging|xargs|cut -d' ' -f2|sed s/%// )"
    battery="$( upower -i $(upower -e | grep '/battery') | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%// )"
    current_date=$(date +'%Y-%m-%d')
    date_h=$(date +'%Y-%m-%d-%H:%M')
    echo "$date_h $battery $charging_state " >> ~/log/battery-"$current_date".log

    sleep 60
done
