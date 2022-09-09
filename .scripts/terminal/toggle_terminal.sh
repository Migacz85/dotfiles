
#This terminal is intented to behave like quake terminal but tilled
#When not in use move (hide) to selected workspace
#
#toggle_terminal [title] [workspace_to_hide] [width]
#
count_windows=$(xdotool search --all --onlyvisible --desktop $(xprop -notype -root _NET_CURRENT_DESKTOP | cut -c 24-) "" 2>/dev/null | wc -l)
count_terminals=$(xdotool search --name --onlyvisible terminal[0-9] | wc -l) #This should count better
is_terminal_visible=$(xdotool search --name --onlyvisible ^$1$)
is_terminal_open=$(xdotool search --name ^$1$)

# !!!!!! split v is Horizontal and h is vertical !!!!!!
# split v ___  split h |

    if [[ ! -z $is_terminal_open ]]; then

        # i3-msg [title=^$1$] split v  # From some reason this is not working as expected
        # i3-msg "[title=^$1$] split v"  #This also
        i3-msg [title=^terminal0$] split v
        i3-msg [title=^terminal1$] split v
        else
        echo "Terminal is already opend... skipping"
        open_and_enumarate_terminal.sh &
        # window_name=$(xdotool getactivewindow)
        # window_name=$(xdotool getwindowname $window_name)
        # window_name='terminal0'
        # i3-msg move workspace current
        i3-msg  [title=^$1$] move up
        i3-msg  [title=^$1$] move up
        i3-msg  [title=^$1$] resize set 0 $3
        i3-msg [title=^$1$] split v
    fi

#  DOWN
#

if [[ $3 == 'down'  ]]; then
    if [[ ! -z $is_terminal_visible ]]; then
        echo "[$(date)] : this window already displayed on this desktop $is_window_exist"
        i3-msg [title=^$1$] move workspace $2
    else
        i3-msg [title=^$1$] move workspace current &&
        i3-msg [title=^$1$] move down &&
        i3-msg [title=^$1$] move down &&
        i3-msg [title=^$1$] move down &&
        i3-msg [title=^$1$] move down &&
        i3-msg [title=^$1$] move down &&
        # resize shrink height 5px or 5ppt
        i3-msg [title=^$1$] resize set 0 $4
        i3-msg [title=^$1$] focus
        i3-msg [title=^$1$] split h
        i3-msg [title=^terminal2$] split h
        i3-msg [title=^terminal3$] split h
        i3-msg [title=^$1$] focus
        i3-msg [title=^$1$] resize set 0 150

        # if [[ $count_terminals -ge 2 ]]; then
        #       i3-msg [title=^$1$] resize set 0 $4
        #       sleep 1
        #       i3-msg [title=^$1$] move up
        # fi

    fi
fi

if [[ $3 == 'right'  ]]; then
    if [[ ! -z $is_terminal_visible ]]; then
        echo "[$(date)] : this window already displayed on this desktop $is_window_exist"
        i3-msg [title=^$1$] move workspace $2
    else
        i3-msg [title=^$1$] move workspace current &&
        if [[ $count_terminals == 0 ]]; then
        i3-msg [title=^$1$] move right
         fi
        # resize shrink height 5px or 5ppt
        i3-msg [title=^$1$] focus
    fi
fi

##Right
#     if [[ $count_terminals == 1 ]]; then
#        i3-msg [title=^$1$] move right
#        i3-msg [title=^$1$] split v
#     fi 
#     if [[ $count_terminals == 2 ]]; then
#        i3-msg [title=^$1$] split h
#     fi 
