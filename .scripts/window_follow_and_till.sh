#!/usr/bin/env bash
# This script run whatever you want
# when workpsace of your desktop is changed
# set -euo pipefail

DIR="/home/migacz/"

  while :
  do

    function show_focused_window() {
    focused_ws=$(i3-msg -t get_workspaces | python -c 'import json,sys;ws=json.load(sys.stdin); print(list(filter(lambda x: x["focused"], ws))[0]["name"])')
    echo $focused_ws
    }

    ws=$(show_focused_window)   # Check what workspace is focused
    focused_ws=${ws::1}
    second_char=${ws:1:1}

    last_focused_ws=$(<$DIR""last_ws.temp)

    # When there is a switch between workspaces:
    if [[ "$focused_ws" != "$last_focused_ws" ]]; then
        END=$(date +%s);
        echo $focused_ws > $DIR""last_ws.temp

        #Do your stuff on ws change
        ###########################
        ###########################
        bash mini-window.sh

        ###########################
        ###########################
        # Finish
        #

        START=$(date +%s);
        echo $START > $DIR""start.txt
    fi
     sleep 0.1
  done
