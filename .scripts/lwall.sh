#!/bin/bash

dir="/home/migacz/.wallpapers/"

pid=$(pgrep compton)
if [[ $pid > 0  ]];then
    wal -i "$dir" -l  --saturate 0.9 -a 70 -n -e -b '#FBF7E4'
else
    wal -i "$dir" -l  --saturate 0.9 -n -e -b '#FBF7E4'
fi

update-css.sh
# qutebrowser ':set content.user_stylesheets /home/migacz/Downloads/git/solarized-everything-css/css/darculized-all-sites.css'
# (cat ~/.cache/wal/sequences &)

# i3 restart
