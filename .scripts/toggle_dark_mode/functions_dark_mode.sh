#!/usr/bin/env bash

function  SetBrowser {
  # Restart chrome browsers and set dark theme
  # if you dont have i3-msg - you can use:
  #  wmctrl -a $1 instead of i3-msg query 
  i3-msg [class=$1] focus && xdotool key Alt_L+d && xdotool type "chrome:restart" && xdotool key Return
  sleep 2
  i3-msg [class=$1] focus && xdotool key Alt_L+Shift_L+d
  i3-msg [class=$1] focus && xdotool key Alt_L+r
  }


function ExecFuncIfWmClassExist {
  # Check if program is open $2 then execute function $1
  # Execute function $1 if program $2 is open 
  isWindowOpen=$(xdotool search --name ^$2$)
  if [[ $isWindowOpen ]]; then
  $@ 
  echo "true $2 is open starting function: $@"
  else
  echo "false"
  fi
}

# 1 find 2 write 3 path
# 1. find the word you want to update, 2. Your new setting string 3. Path to file you are updating
function FindMatchInFileAndWriteAfter {
  sed -i "s/\($1\)\(.*\)/\1$2/" $3 
}


function RestartTelegram {
  pkill telegram && telegram-desktop & 
}

function RestartCode {
  pkill code && code 
}

function TermiteDark {
  TERMITE_DIR="$HOME/.config/termite"
  COLORS_DIR='/usr/share/termite-style/colors'
  random_scheme=gruvbox-dark.config
  sed -i '/colors/Q' $TERMITE_DIR/config; cat $COLORS_DIR/$random_scheme >> $TERMITE_DIR/config;
  killall -USR1 termite > /dev/null
  tput sgr0
  tput op
}

function TermiteLight {
  TERMITE_DIR="$HOME/.config/termite"
  COLORS_DIR='/usr/share/termite-style/colors'
  random_scheme=gruvbox-light.config
  sed -i '/colors/Q' $TERMITE_DIR/config; cat $COLORS_DIR/$random_scheme >> $TERMITE_DIR/config;
  killall -USR1 termite > /dev/null
  tput sgr0
  tput op
}

function RestartQutebrowser {
  qutebrowser restart

  i3-msg [class='qutebrowser'] focus && xdotool type ":restart" && xdotool key Return
}
