#!/bin/bash
# This script is running pywal and generating new  color-scheme
# running update-css.sh for injecting color-scheme to css file
# That way terminal colors and qutebrowser colors are the same

# https://github.com/dylanaraps/pywal

dir="/home/migacz/.wallpapers"

# wal -i "$dir"  --iterative --saturate 0.5 -a 60 -n -e

wal -i "$dir"  --saturate 0.5 -n -e -b '#191919'

# wal -i "$dir" --saturate 0.9 -a 70 -n -e -b '#FFFF'
# qutebrowser ':set content.user_stylesheets /home/migacz/Downloads/git/solarized-everything-css/css/apprentice/apprentice-all-sites.css '
# update-css.sh
