#!/usr/bin/env bash
hibernation_percentage=10  
delay_after_waking_up=300  #After waking up from hibernation wait 300 seconds before scripts starts again.
check=6 # How often check battery level

#TODO, check if battery is in discharging mode before
#putting into hibernation

hibernation=0

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

if [[ "$1" == "-hibernate" ]]; then
      SECONDS=0
      echo "Running hibernation command..."
      systemctl hibernate
      sleep 10
      echo "Resurrection... " 
      sleep_time=$(show_time $SECONDS)
      notify-send "I was hibernated for: $sleep_time "
fi

if [[ "$1" == "-monitor" ]]; then
echo "I will hibernate when battery will be bellow $hibernation_percentage%"
echo "checks are every $check seconds"
  while true 
  do
    if [[ $hibernation -eq 1 ]]; then
     sleep 10 
     echo "Resurrection... " 
     sleep_time=$(show_time $SECONDS)
     echo $sleep_time
     notify-send "I was hibernated for: $sleep_time "
     echo "Script will start monitoring battery after $delay_after_waking_up seconds."
     sleep $delay_after_waking_up 
    else
     sleep $check 
    fi
    hibernation=0
    battery="$( upower -i $(upower -e | grep '/battery') | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%// )"
    if [[ $battery -lt $hibernation_percentage ]]; then
      SECONDS=0
      echo "Battery level is: $battery"
      echo "Running hibernation command..."
      systemctl hibernate
      hibernation=1
    fi 
  done
fi  
