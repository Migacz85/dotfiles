#!/usr/bin/env bash

WS=`python3 -c "import json; print(next(filter(lambda w: w['focused'], json.loads('$(i3-msg -t get_workspaces)')))['num'])"`; i3-input -F "rename workspace to $WS:%s" -P 'New name'
