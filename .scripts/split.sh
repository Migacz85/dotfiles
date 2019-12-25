#!/usr/bin/env bash
#sudo pacman -Rs xorg-xwininfo xdotool xprop
count_windows=$(xdotool search --all --onlyvisible --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) "" 2>/dev/null | wc -l)

# Get the coordinates of the active window's
#    top-left corner, and the window's size.
#    This excludes the window decoration.

unset x y w h

eval $(xwininfo -id $(xdotool getactivewindow) |
           sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
               -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
               -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
               -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )
echo -n "$x $y $w $h"

pids=$(xdotool search --all --onlyvisible --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) "" 2>/dev/null)

choice="matrix"

# notify-send "Current layout:" $choice -h string:x-canonical-private-synchronous:my-notification

if [[ $choice == "matrix" ]]; then
    if [ $count_windows -eq 1 ]; then
        i3-msg split v
    fi
    if [ $count_windows -eq 2 ]; then
        if [ $y -gt 500  ]; then
            i3-msg move right
            i3-msg split v
        fi
    fi

    if [ $count_windows -eq 4 ]; then
        if [ $x -gt 900 ] && [ $y -gt 700  ]; then
             i3-msg move left
        fi

        if [ $x -lt 500 ] && [ $y -gt 700 ]; then
            i3-msg move right
        fi

    fi

fi

if [[ $choice == "vertical" ]]; then
    if [ $count_windows -eq 1 ]; then
    i3-msg split v
    fi
fi

# For full hd resolution XxY coordinates
# |14x14  | 500x14
# ----------------
# |14x500 |942x500

# if [[ $choice == "sides2" ]]; then
#     if [[ $count_windows -eq 1 ]]; then
#     i3-msg split v
#     fi

#     if [[ $count_windows -eq 2 ]]; then
#     i3-msg split h
#     fi
#     if [[ $count_windows -eq 3 ]]; then
#     i3-msg split v
#     i3-msg move right
#     i3-msg move right
#     fi
#     if [[ $count_windows -eq 4 ]]; then
#     i3-msg split v
#     fi
# fi


# if [[ $choice == "split-second" ]]; then
#     if [[ $count_windows -eq 1 ]]; then
#     i3-msg split h
#     fi
#     if [[ $count_windows -eq 2 ]]; then
#     i3-msg split v
#     fi
# fi


# if [[ $choice == "spiral-vertical" ]]; then
#     if [[ $count_windows -eq 1 ]]; then
#     i3-msg split h
#     fi
#     if [[ $count_windows -eq 2 ]]; then
#     i3-msg split v
#     fi
#     if [[ $count_windows -eq 3 ]]; then
#     i3-msg split h
#     fi
#     if [[ $count_windows -eq 4 ]]; then
#     i3-msg split v
#     fi
# fi

# if [[ $choice == "spiral-horizontal" ]]; then

#     if [[ $count_windows -eq 1 ]]; then
#     i3-msg split v
#     fi

#     if [[ $count_windows -eq 2 ]]; then
#     i3-msg split h
#     fi

#     if [[ $count_windows -eq 3 ]]; then
#     i3-msg split v
#     fi

#     if [[ $count_windows -eq 4 ]]; then
#     i3-msg split h
#     fi

#     if [[ $count_windows -eq 5 ]]; then
#     i3-msg split v
#     fi

# fi


# # for pid in $pids; do
# #     name=$(xdotool getwindowname $pid)
# #     i=$(($i+1))
# #     # if [[ $name == "urxvt" ]]; then
# #     #Do what you want, $pid is your sought for PID,
# #     #matching both class gvim and TODO in title
# #     xdotool windowfocus $pid
# #     if [ $i -eq 1 ]; then
# #         i3-msg move container right
# #         i3-msg split h
# #         sleep 1
# #     fi
# #     if [ $i -eq 2 ]; then
# #         i3-msg move container right
# #         i3-msg split h
# #         sleep 1
# #     fi
# #     echo $pid
# #     # fi
# # done
