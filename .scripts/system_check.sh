#!/usr/bin/env bash

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

function user_away() {
  # 1 - Means that computer was hibernated, poweroff, or suspended.
  # Can be used to check if user is away
  time1=$( date +'%s' )
  sleep 1 
  time2=$(($( date +'%s') - 1 ))
  if [[ $time1 == $time2 ]]; then
  echo 0
  else
  echo 1 
     msg=$(show_time $(($time2-$time1)))
     echo $msg
     notify-send "User was away for: " "$msg"
  fi  
}


for (( i = 0; i < 100; i++ )); do

user_away

done
