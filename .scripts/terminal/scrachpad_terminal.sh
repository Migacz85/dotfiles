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

i3-msg "[title=^(?!$1).*$ class="Termite" floating] move to scratchpad"
i3-msg [title="$1" floating] scratchpad show
i3-msg "[title=$1] floating enable ;"

# i3-msg "[title=$1 floating] move position center "
# i3-msg "[title=$1 floating] resize set 1200 1000"
