# ~/.bash_profile
#export PATH=/home/migacz/anaconda3/bin:$PATH

# Envs
PATH=$PATH:$HOME/.scripts
PATH=${PATH}:${HOME}/.local/bin
PATH=$PATH:/root/.gem/ruby/2.6.0/bin
export PROJECT="/home/migacz/Coding/www/5Project"
export BROWSER="qutebrowser"
export EDITOR=vim
export VISUAL=vim
export HISTFILESIZE=-1
export HISTSIZE=-1
export BAT_THEME="OneHalfLight"

# Run startx automatically
####################
if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then

    #Font for TTY
    cd /usr/share/kbd/consolefonts
    setfont ter-120b.psf.gz
    cd ~

    startx
fi

# Fuzzy finder
##############
#source /home/migacz/.fzf/shell/key-bindings.bash
#source /home/migacz/.fzf/shell/completion.bash

unset FZF_CTRL_R_OPTS
unset FZF_DEFAULT_OPTS

export FZF_DEFAULT_OPTS="
     --preview='bat --color=always {}'
     --preview-window up:40:hidden:wrap
     --bind ctrl-o:preview-up,ctrl-n:preview-down
     --bind ctrl-i:toggle-preview
"

# --bind ctrl-p:up,ctrl-m:down
# --bind 'ctrl-y:execute-silent(copyq copy {+} )'
# --bind ctrl-a:select-all
# --bind ctrl-u:half-page-up
# --bind ctrl-d:half-page-down
# --extended

#fuzzy cd
fcd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
               -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
}

#fuzzy hidden cd
fhcd() {
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fh - repeat history
writecmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; }

fhe() {
    ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}

fe() {
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# History
bind '"\C-r": "\C-x1\e^\er"'
bind -x '"\C-x1": __fzf_history';

__fzf_history ()
{
    __ehc $(history | fzf --tac --tiebreak=index | perl -ne 'm/^\s*([0-9]+)/ and print "!$1"')
}

__ehc()
{
    if
        [[ -n $1 ]]
    then
        bind '"\er": redraw-current-line'
        bind '"\e^": magic-space'
        READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${1}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
        READLINE_POINT=$(( READLINE_POINT + ${#1} ))
    else
        bind '"\er":'
        bind '"\e^":'
    fi
}

# Functions
##########################

function anaconda {
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/migacz/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/migacz/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/migacz/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/migacz/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
}

function reload_gtk() {
  theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
  gsettings set org.gnome.desktop.interface gtk-theme ''
  sleep 1
  gsettings set org.gnome.desktop.interface gtk-theme $theme
}

function motivation {
  NUMBER=$(( ( RANDOM % 200 )  + 1 ))
  #echo "Sentencja numer: " $NUMBER
  p="p"
  q="'"
  CMDTXT="sed -n ${q}$NUMBER${p}${q} /home/migacz/.scripts/motivation.csv"
  eval "$CMDTXT"
  if [ $NUMBER -eq 50 ]
  then
  echo  "You should play in lotto - because chance of getting this message is 1 to 200 "
  fi
}

function saydate {
date "+%H:%M,  %A, %B" | trans :pl -play -brief
}

#Compress all images in folder
function compres {
    for photos in *.jpg ;
    do
        convert -verbose $photos -quality 85% -resize 1600x900 opt/$photos-opt.jpg ;
    done
}

# Aliases

# alias qn='bash /home/migacz/Coding/Bash-scripts/qnote/qnote.sh $1 $2 $3'
# alias template="git clone https://github.com/Migacz85/web-template.git"

# Python
alias drefresh="/home/migacz/.emacs.d/bin/doom refresh ."
alias env-init="python -m venv"
alias env-enter="source venv/bin/activate"
alias env-show="pip3 freeze --local"
alias env-install="sudo pip3 install -r"

alias eb="vim /home/migacz/.bash_profile"
alias sb="source /home/migacz/.bash_profile"
alias y="youtube-dl --extract-audio --audio-format mp3"

alias kcast="bash  /home/migacz/.scripts/kindle-cast.sh"
alias speed_reading="cd '/home/migacz/Downloads/git/spread0r' && ./spread0r.pl "
alias mnm="python /home/migacz/.scripts/words/words.py"

alias project="cd $PROJECT && source venv/bin/activate"
alias www="cd /home/migacz/Coding/www"
alias wal="python /home/migacz/.local/bin/wal"

alias run="python3 manage.py runserver localhost:5000"
alias i3config="emacs /home/migacz/.config/i3/config"

# Dirs
alias gd="cd /home/migacz/Downloads"
alias gp="cd /home/migacz/Coding/www"
alias gs="cd /home/migacz/.scripts"
alias gl="cd /srv/http/"

#Tools
alias ten="trans :en"
alias tpl="trans :pl"
#alias t="node /home/migacz/Downloads/torrentflix/bin/torrentflix --open qbittorrent"
alias t="cd ~/Downloads/ ; pirate-get"
alias th="echo 'pirate-get - alias to t
t -R - torrents from last 48h
t -l - list of categories
t -c - choose category
t -c 'Audio' shpongle
t -p 5 - display 500 results from all categories'
"
alias gitin='/home/migacz/go/src/github.com/isacikgoz/gitin/./gitin'
alias h=" echo '

System:

fcd      - fuzzy cd
fcdh     - fuzzy cd hidden
ctr+r    - fuzzy history
fe       - fuzzy find file and edit
i3config - Open i3 config file
compres  - compres all photos in dir you are
youtube  - rip music
project  - go to current project folder

Python:

env-init= python -m venv venv - initialize env
env-enter=source venv/bin/activate - enter to the env
env-show=pip3 freeze --local - show dependencies in this env
env-install=sudo pip3 inastall -r - install files from file

Shourtcats:

Control focus:
win +
h j k l  left down up right

ctrl+shift+controls - move windows in specific diretion
ctrl+\  - next window will be vertical    ||
ctrl+'  - next windowl will be horizontal   =

Standart:
win + s or w or e - tilling/stacking modes
win + q - kill window
win + shift + q - options for system logout/restart/shutdown
win + shift + r - reload
'"

####################
# Pywall - Colors
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.

(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)

cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.

source ~/.cache/wal/colors-tty.sh

####################
# Shell start

# clear
motivation

# Run script

# screenfetch -n
# inxi
# echo " "
# inxi -w
# echo " "
# tput setaf 6; motivation
