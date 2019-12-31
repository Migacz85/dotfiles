#!/bin/bash

dir="/home/migacz/.wallpapers/"

pid=$(pgrep compton)
if [[ $pid > 0  ]];then
    wal -i "$dir" -l  --saturate 0.9 -a 60 -n -e -b '#ffffff'
else
    wal -i "$dir" -l  --saturate 0.9 -n -e -b '#ffffff'
fi

update-css.sh
# qutebrowser ':set content.user_stylesheets $HOME/Downloads/git/solarized-everything-css/css/darculized-all-sites.css'
(cat ~/.cache/wal/sequences &)

# i3 restart
