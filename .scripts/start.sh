#!/usr/bin/env bash

source ~/.bash_profile
# wal -R
# cat /home/migacz/.cache/wal/sequences
# xrdb merge .Xresources
exec termite -t $1 -e $2
wal -R
