#!/bin/bash

dir="/home/migacz/.wallpapers/"

pid=$(pgrep compton)
if [[ $pid > 0  ]];then
    wal -i "$dir" -l  --saturate 0.9 -a 60 -n -e -b '#ffffff'
    sed -i '2s/.*/gtk-theme-name=bright/' /home/migacz/.config/gtk-3.0/settings.ini
else
    wal -i "$dir" -l  --saturate 0.9 -n -e -b '#ffffff'
    sed -i '2s/.*/gtk-theme-name=bright/' /home/migacz/.config/gtk-3.0/settings.ini
fi

# update-css.sh
# qutebrowser ':set content.user_stylesheets $HOME/Downloads/git/solarized-everything-css/css/solarized-light/solarized-light-all-sites.css'
(cat ~/.cache/wal/sequences &)

# i3 restart
