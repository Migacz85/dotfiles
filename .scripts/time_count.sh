#!/usr/bin/env bash
DIR="/home/migacz/stats/"
lazy_user=0
# mkdir $DIR
cd $DIR
START=$(date +%s);
echo $START > $DIR""start.txt

# Set name of your workspaces:
ws[1]=" Coding: "
ws[2]=" Ux: " 
ws[3]=" Documentation: " 
ws[4]=" Konsole: " 
ws[5]=" Ranger: " 
ws[6]=" Project: " 
ws[7]=" Browser: " 
ws[8]=" Slack: " 
ws[9]=" Mail/Telegram: " 
ws[10]=" Notes: " 
ws[11]=" Vlc/torrents: " 
ws[12]=" Finance: " 
ws[13]=" Youtube: " 

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

function was_it_hibernated() {
  #Checks if system was hibernated in last minute
  #TODO suspendig should also be included here
  response=$(journalctl -b | grep "$(date +'%h %d %H:%M')" | grep "suspend\|hibernate")
  if [[ $response != "" ]]; then
   echo 1 
  else
    echo 0
  fi
}

# function was_it_hibernated() {
#   # 1 - Means that computer was hibernated, poweroff, or suspended.
#   # Can be used to check if user is away
#   time1=$( date +'%s' )
#   sleep 1 
#   time2=$(($( date +'%s') - 1 ))
#   if [[ $time1 == $time2 ]]; then
#   echo 0
#   else
#     msg=$(show_time $(($time1-$time2)))
#     notify-send "User away:" "$msg"
#   echo 1 
#  fi  
# }


function track_time() {
  # $1 - filename  (and name of a task)
  # Update time spent on given task
  # And save it to the file.

  today=$( date +'%Y/%m/%d' )
  line=$(tail -n 1 $1)
  last_date=$(cut -d "," -f 1 <<< "$line")

  ## Check if the last date in a file is same as today date
  if [[ $last_date == $today ]]; then

     # Count how long user spent on task  
     START=$(<$DIR""start.txt)
     time_diff=$(((END-START)))

    # But if user was lazy count it as 0 
    if [[ lazy_user -eq 1 ]]; then
      START=$(date +%s); 
      time_diff=0
    fi

    add_time=0

    # Update time for today in file
    line=$( cut -d "," -f 2 <<< "$line" )
    add_time=$(( $line + $time_diff ))
    head -n -1 $DIR""$1 > temp.txt ; mv temp.txt $1
    echo "$today, $add_time" >> $1

  ## If not just add new date with counted time
  else
    time_diff=$(((END-START)))

    # But if user was lazy count it as 0 
    if [[ lazy_user -eq 1 ]]; then
      START=$(date +%s); 
      time_diff=0
    fi

    echo "$today, $time_diff" >> $1
  fi

echo "Previous workspace was $1"
}

function show_focused_window() {
focused_ws=$(i3-msg -t get_workspaces | python -c 'import json,sys;ws=json.load(sys.stdin); print(list(filter(lambda x: x["focused"], ws))[0]["name"])')
echo $focused_ws
}


if [[ "$1" == "-tracki3wm" ]]; then

  while :
  do
    timestamp=$( date +'%Y/%m/%d %H:%M' )
    sleep 1 # Refresh rate
    idle=$( xprintidle ) # Time where user was not active at all
    idle_minutes=$(($idle/1000/60))
    was_hibernated=$(was_it_hibernated)
 
    if [[ $idle_minutes > 16  ]] || [[ $was_hibernated == 1 ]]; then
      #Events when count will not be added

      echo "$timestamp User was lazy or comp was hibernated/suspended"
      lazy_user=1
      START=$(date +%s); 
      echo $START > $DIR""start.txt
      else 
      lazy_user=0
    fi

    cd $DIR 
    ws=$(show_focused_window)   # Check what workspace is focused
    focused_ws=${ws::1}
    second_char=${ws:1:1}


    re='^[0-9]+$'
    if [[ $second_char =~ $re ]] ; then
      focused_ws=${ws::2}
    fi

    if [ ! -f $focused_ws ]; then
      echo "data file not found, creating new one"
      echo $( date +'%Y/%m/%d' ) > $focused_ws
    fi

    last_focused_ws=$(<$DIR""last_task.txt) 

    # When there is a switch between workspaces:
    if [[ "$focused_ws" != "$last_focused_ws" ]]; then
      END=$(date +%s);
      echo $focused_ws > last_task.txt
      track_time $last_focused_ws 
      START=$(date +%s);
      echo $START > $DIR""start.txt
    fi

  done

fi

if [[ "$1" == "-task" ]]; then

  current_task=$2
  last_task=$(<$DIR""last_task.txt)
  if [[ "$current_task" != "$last_task" ]]; then
    echo "Tracking new task"
    cd $DIR 
    END=$(date +%s);
    echo $2 > last_task.txt
    track_time $last_task 
  fi
  START=$(date +%s);
  echo $START > $DIR""start.txt
fi

if [[ "$1" == "-reset" ]]; then

  cd $DIR 
  echo "start counting"
  START=$(date +%s);
  echo $START>$DIR""start.txt
fi

if [[ "$1" == "-stats" ]]; then
  # example: 
  # -stats 0 - show stats for today
  # -stats 1 - show summary for today and yesterday

 function number_of_days() {
   # Count total sum of time spent on task. 
   # Using formula: today - number_of-days
   # $1  - file to read 
   # $2  - number of days to sum from today
   sum=0
   date_from_file=0
   i=0
   sum_till_date=$(date -d ''$2' day ago' +'%Y/%m/%d')

    while read p; do
      i=$(($i+1))
      t=$(tail -n $i $1 | head -1)
      date_from_file=$(cut -d "," -f 1 <<< "$t")
      
      if [[ $date_from_file -eq $sum_till_date  ]]; then
        line=$(tail -n $i $1 | head -1)
        line=$( cut -d "," -f 2 <<< "$line" )
        # echo "true"
        sum=$((sum + line))
      fi

    done < $1
  show_time $sum

  if [[ $sum == 0 ]]; then
   echo "" 
  fi
 }
  # Print the results
  sum_till_date=$(date -d ''$2' day ago' +'%Y/%m/%d')
  echo "Summary statistics till $sum_till_date" 
  echo "=================================="
  for index in ${!ws[*]}
  do
    echo -n ${ws[$index]} " "
    number_of_days $index $2  
  done
 fi

if [[ "$1" == "-help" ]]; then
   echo "-help          Display this help file"
   echo "-tracki3wm     Start tracking time that is spent on i3wm workspaces." 
   echo "-day           Show stats for current day"
   echo "-week          Show stats from last week"
fi
