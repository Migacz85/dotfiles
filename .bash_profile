# ~/.bash_profile
#export PATH=/home/migacz/anaconda3/bin:$PATH

# Envs
PATH=$PATH:$HOME/.scripts
for d in $HOME/.scripts/*/; do
    PATH+=":$d"
done

PATH=${PATH}:${HOME}/.local/bin
PATH=$PATH:/root/.gem/ruby/2.6.0/bin
PATH=$PATH:~/.emacs.d/bin
export PROJECT="/home/migacz/Coding/www/5Project"
# export BROWSER="qutebrowser"
export EDITOR=vim
export VISUAL=vim
export HISTFILESIZE=-1
export HISTSIZE=-1
export BAT_THEME="Monokai Extended Light" #dark
export BAT_THEME="base64" #light
export NNN_PLUG='o:fzopen;p:mocplay;d:diffs;m:nmount;n:notes;v:imgviu;t:imgthumb'

export QT_STYLE_OVERRIDE=kvantum-dark

#https://www.overclockers.co.uk/forums/threads/firefox-now-supports-hardware-video-acceleration-youtube-etc.18900661/
export MOZ_X11_EGL=1

# Run startx automatically
####################
if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
    #Font for TTY
    cd /usr/share/kbd/consolefonts
    setfont ter-120b.psf.gz
    cd ~
    startx
fi
# XDG_RUNTIME_DIR for mpv hardware acceleration
if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR=/tmp
    if [ ! -d  "$XDG_RUNTIME_DIR" ]; then
        mkdir "$XDG_RUNTIME_DIR"
        chmod 0700 "$XDG_RUNTIME_DIR"
    fi
fi

if [[ $(ps --no-header -p $PPID -o comm) =~ termite|yakuake ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi

#Enumrate terminals

window_name=$(xdotool getactivewindow)
window_name=$(xdotool getwindowname $window_name)

if [[ $window_name == 'terminal0' ]]; then
    PS1='1\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

if [[ "$window_name" == 'terminal1' ]]; then
    PS1='2\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

if [[ "$window_name" == 'terminal2' ]]; then
    PS1='3\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

if [[ "$window_name" == 'terminal3' ]]; then
    PS1='4\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi

if [[ "$window_name" == 'terminal4' ]]; then
    PS1='5\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
fi















# Fuzzy finder
##############
#source /home/migacz/.fzf/shell/key-bindings.bash
#source /home/migacz/.fzf/shell/completion.bash
#if using git-fzf
# source /usr/share/bash-completion/completions/fzf

unset FZF_CTRL_R_OPTS
unset FZF_DEFAULT_OPTS

export FZF_DEFAULT_OPTS="
     --preview='bat --color=always {}'
     --preview-window up:40:hidden:wrap
     --bind ctrl-o:preview-up,ctrl-k:preview-down
     --bind ctrl-i:toggle-preview
     --bind ctrl-l:down
"

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
alias modes='grep -Ev "#|bindsym"  ~/dotfiles/.config/i3/config | grep "mode"'
alias ec='cd ~/.config/ && fe'
alias bindings='grep -Ev "#|mode"  ~/dotfiles/.config/i3/config | grep "\$mod"'
alias ls='ls --color -h --group-directories-first'
alias eb="vim /home/migacz/.bash_profile"
alias sb="source /home/migacz/.bash_profile"
alias y="youtube-dl --extract-audio --audio-format mp3"
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias ecrypt_file='gpg2 -c'

alias pd='pandoc "$1" \
    -f gfm \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
    --pdf-engine=xelatex \
    -o "$2"'

#download mails
alias dmail='time mbsync -c ~/.config/mu4e/mbsyncrc -a'
#Youtube
alias pv='pipe-viewer'
alias ytdt='pipe-viewer --skip-if-exists  --wget-dl --upload https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg -A'
alias ytluke='pipe-viewer --skip-if-exists  --wget-dl --upload  https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA -A'
alias ytnews='pipe-viewer --skip-if-exists  --wget-dl --upload  https://www.youtube.com/channel/UCoMdktPbSTixAyNGwb-UYkQ -A --skip-watched'
alias ytbloomtech='pipe-viewer --skip-if-exists  --wget-dl --upload  https://www.youtube.com/channel/UCrM7B7SL_g1edFOnmj-SDKg -A --skip-watched --get-captions'
alias ythealth='pipe-viewer --skip-if-exists  --wget-dl --upload  https://www.youtube.com/user/Calisthenicmovement -A'
alias ytguitar='pipe-viewer --skip-if-exists  --wget-dl --upload  https://www.youtube.com/c/SkyGuitar'

# alias qn='bash /home/migacz/Coding/Bash-scripts/qnote/qnote.sh $1 $2 $3'
# alias template="git clone https://github.com/Migacz85/web-template.git"
#Shell
# Python

alias env-init="python -m venv"
alias env-enter="source venv/bin/activate"
alias env-show="pip3 freeze --local"
alias env-install="sudo pip3 install -r"

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
alias cam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"
alias ten="trans pl:en"
alias tpl="trans en:pl"
alias t="cd ~/Downloads/#Income ; pirate-get"
alias th="echo 'pirate-get - alias to t
t -R - torrents from last 48h
t -l - list of categories
t -c - choose category
t -c 'Audio' shpongle
t -p 5 - display 500 results from all categories'
"
alias gitin='/home/migacz/go/src/github.com/isacikgoz/gitin/./gitin'


####################
# Pywall - Colors
# Import colorscheme from 'wal' asynchronously
# (cat ~/.cache/wal/sequences &)
# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
####################
# Shell start
motivation
