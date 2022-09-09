# #!/bin/bash


# #list all windows and state
# opened_windows=$(wmctrl -l -x | grep -e '  1' -e ' 0' -e ' 2' |awk '{$2=""; $1=""; print $3}' | cut -f1 -d".")
# # echo $opened_windows grep -e '  1' -e ' 0' -e ' 2'
# echo $open_windows
# for open_window in $opened_windows; do
#    echo $open_window
#    if [ $open_window != "$1" ]; then
#    i3-msg [instance=$open_window] scratchpad show
#    fi
# done

# Move every floating window except $1 to scrachpad. 
# its good if you are not using floating windows at all. 
# But every floating window will vanish in scrachpad...

i3-msg "[title=^(?!$1).*$ class="Alacritty" floating] move to scratchpad"

# i3-msg "[title=^(?!terminal[0-9]).*$ class="Alacritty" floating] move to scratchpad"
i3-msg [title="$1" floating] scratchpad show
i3-msg "[title=$1] floating enable ;"

