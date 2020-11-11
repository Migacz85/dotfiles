#!/usr/bin/env bash
#Simple script to test your battery

function show_time () {
    num=$1
    min=0
    hour=0
    day=0
    if((num>59));then
        ((sec=num%60))
        ((num=num/60))
        if((num>59));then
            ((min=num%60))
            ((num=num/60))
            if((num>23));then
                ((hour=num%24))
                ((day=num/24))
            else
                ((hour=num))
            fi
        else
            ((min=num))
        fi
    else
        ((sec=num))
    fi
    if [[ $day != 0 ]]; then
    echo "$day"d "$hour"h "$min"m
    elif [[ $hour != 0 ]]; then
    echo  "$hour"h "$min"m
    elif [[ $min != 0 ]]; then
    echo  "$min"m
    elif [[ $sec != 0 ]]; then
    echo  "$sec"s
    fi
}

while true; do

    charging_state="$( upower -i $(upower -e | grep '/battery') | grep --color=never -E charging|xargs|cut -d' ' -f2|sed s/%// )"
    battery="$( upower -i $(upower -e | grep '/battery') | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%// )"
    current_date=$(date +'%Y-%m-%d')
    date_h=$(date +'%Y-%m-%d-%H:%M')
    echo "$date_h $battery $charging_state " >> ~/log/battery-"$current_date".log

    # if [[ "$battery" == 100 ]]; then
    # time1=$( date +'%s' )
    # time_start=$( date +'%s' )
    # echo -n $(date +'%Y/%m/%d %H:%M' --date="-$away_time_sec sec")" "$(date +'%Y/%m/%d %H:%M') >> $DIR2
    # away_time_h=$(show_time $(($time2-$time1)))
    # fi
    # if [[ "$battery" < 5 ]]; then
    # time2=$( date +'%s' )
    # d_titme=$(show_time $(($time2-$time1)))
    # echo "discharging from  100 to 75:  $d_time  " >> ~/stats/battery-dtime-"$current_date".log
    # time1=$( date +'%s' )
    # fi

    sleep 60
done
