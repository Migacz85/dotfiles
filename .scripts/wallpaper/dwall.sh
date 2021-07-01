#!/bin/bash
# This script is running pywal and generating new  color-scheme
# running update-css.sh for injecting color-scheme to css file
# That way terminal colors and qutebrowser colors are the same

# https://github.com/dylanaraps/pywal

dir="/home/migacz/.wallpapers"

# wal -i "$dir"  --iterative --saturate 0.5 -a 60 -n -e

wal -i "$dir"  --saturate 0.5 -n -e -b '#191919' 
sed -i '2s/.*/gtk-theme-name=Matcha-dark-sea/' /home/migacz/.config/gtk-3.0/settings.ini

rm  $HOME/.config/rofi/colors-rofi-dark.rasi
cp $HOME/.cache/wal/colors-rofi-dark.rasi $HOME/.config/rofi/colors-rofi-dark.rasi

# wal -i "$dir" --saturate 0.9 -a 70 -n -e -b '#FFFF'
# qutebrowser ':set content.user_stylesheets $HOME/Downloads/git/solarized-everything-css/css/apprentice/apprentice-all-sites.css '
# update-css.sh
