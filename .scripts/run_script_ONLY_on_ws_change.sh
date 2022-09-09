#!/usr/bin/env bash
set -euo pipefail

DIR="/home/migacz/"


function show_focused_window() {
focused_ws=$(i3-msg -t get_workspaces | python -c 'import json,sys;ws=json.load(sys.stdin); print(list(filter(lambda x: x["focused"], ws))[0]["name"])')
echo $focused_ws
}

ws=$(show_focused_window)   # Check what workspace is focused
focused_ws=${ws::1}
second_char=${ws:1:1}

last_focused_ws=$(<$DIR""last_ws.temp)

  while :
  do
    # When there is a switch between workspaces:
    if [[ "$focused_ws" != "$last_focused_ws" ]]; then
        END=$(date +%s);
        echo $focused_ws > last_ws.temp

        #do your stuff on ws change
        notify-send "ws change"
        i3-msg '[instance=^gl$]' move workspace current && i3-msg '[instance=^gl$]' focus && bash split.sh; mode "default"
        START=$(date +%s);
        echo $START > $DIR""start.txt
    fi
    sleep 1
  done
