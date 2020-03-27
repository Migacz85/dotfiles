#!/usr/bin/env bash

terminal='termite'
nameArg='-t'


count_windows=$(xdotool search --all --onlyvisible --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) "" 2>/dev/null | wc -l)

pids=$(xdotool search --name "terminal0" | wc -l)

if [[ pids -eq 0 ]]; then
     exec $terminal $nameArg terminal0
fi

pids=$(xdotool search --name "terminal1" | wc -l)
if [[ pids -eq 0 ]]; then
     exec $terminal $nameArg terminal1
fi

pids=$(xdotool search --name "terminal2" | wc -l)
if [[ pids -eq 0 ]]; then
     exec $terminal $nameArg terminal2
fi

pids=$(xdotool search --name "terminal3" | wc -l)
if [[ pids -eq 0 ]]; then
     exec $terminal $nameArg terminal3
fi

pids=$(xdotool search --name "terminal4" | wc -l)
if [[ pids -eq 0 ]]; then
    exec $terminal $nameArg terminal4
fi
