# I3wm Config Files

This repository will help you with installation of i3wm on fresh
manjaro installation. It should install i3wm alng with all dotfiles,
setup vim and spacemacs. This repo contains also few useful scripts to
deal with i3wm, like changing escape with capslock. Or mini-window to 
play videos in small window while you working

Ranger with devicons, kawase-blur, and bat.
![File manager](https://i.imgur.com/VrcmI9v.jpg) 
Youtube with kawase-blur and mini-window script
![Youtube](https://i.imgur.com/ZdZKUfn.jpg) 
Tilling look
![Tilling in i3wm](https://i.imgur.com/YsTHa6S.png)
Htop with kawase-blur
![Htop](https://i.imgur.com/lC4KLQ6.png)
Qutebrowser with kawase-blur and solarized-everything-css
![Qutebrowser](https://i.imgur.com/p8NhOkL.png)

# Installation 

Firstly go to https://manjaro.org/download/ and download and install manjaro with flavor you
like. When you will have fresh installation just run:

1. Manually rename `.bash_profile`, `.profile`, `.Xresources`

2. Please inspect script setup-env.sh before running. Maybe you don't want to
install specific apps. - Simply delete installation lines before running.

3. 
`bash
git clone https://github.com/Migacz85/dotfiles.git
cd dotfiles 
bash setup-env.sh
`

Script should instal & setup:
- i3wm
- compton with kawase blur
- pywal
- ranger with:
  - icons 
  - colored code preview
- mpv 
  - when playing movies, subtitles will be downloaded automatically.
- qutebrowser 
  - with installed dark, solarized themes
- vim (I used vim a lot but right now I'm using it to quick edits in terminal) 
  - install all plugs and config
- spacemacs (I found doom emacs edition latley much better and less bloated/buggy than spacemacs)

### Tilling

This "feature" relay on `split.sh` script.

By default windows will start openning in matrix way:

- | 1 | 2 |
- | 4 | 3 |

If you don't like it got to `split.sh` and find variable:

- `choice="matrix"`

and change it to

- `choice="none"`

and windows will split like in standart i3wm

| 1 | 2 | 3 | 4 |

- `win + |` spliting verticaly
- `win + '` spliting horizontaly


### I3wm shortcuts

 - F1 - Move focus on browser
 - F2 - Move focus on emacs
 - F3 - Clipboard 
 - F4 - File manager (ranger)
 - F5 - Youtube
 - F6 - Process manager (Htop)
 - F12 - Quake terminal

`win + d` - open programs <br>

### Display Brightness and temperature

- `win + shift 1 and 2` control brightness
- `win + shift 3 and 4` control redshift 
- `win + shift 5 and 6` control gaps between windows 

### External monitor

- `win + shift ]` Send display on external monitor 

This combination of keys will run `external_monitor.sh` script.
And it will togle between displaying on:

- laptop screen
- laptop and external montior
- only external monitor

Inspect `external_monitor.sh` script, run xrandr on your device. 
And change this variables in apriopriate way:

`EXTERNAL_OUTPUT="HDMI1"
INTERNAL_OUTPUT="eDP1"`

### Themes changing

`win + t` - will open change theme mode
`p` - setup previous wallpaper (located in ~/.wallpapers) 
`n` - setup next wallpaper
`l` - set fonts colors in terminal to light mode (keep pressing will setup new colors)
`d` - set fonts colors in terminal to dark mode (keep pressing will setup new colors)
`k` - kill compton (if you want extra cpu power you can do that)
`c` - turn on compton (it will turn on compton with kawase blur) - turn on by default

`esc` - go out from mode

This mode is using `wall.sh` script. Located in folder `/.scripts`

### Moving windows

`win + m` will open mode move
`1` will move window to workspace 1
`2` will move window to workspace 2
...

`9` will move window to workspace 9

### Bring windows

`win + b` will open mode bring (it will bring window to current workspace)
`r` bring ranger
`q` bring qutebrowser
`t` bring telegram
`v` bring vim
`e` bring emacs
`g` bring chromium
`h` bring htop
`1` bring tilled terminal 1
`2` bring tilled terminal 2
`3` bring tilled terminal 3

### Mini-window 

This mode relay on `bottomright.sh` script

`win + n` turn on mini-window mode
`n` put window in the next corner
`s` constantly pressing will change size of mini-window
`t` toggle between floating and tilling 
`y` open youtube in app mode (you can press after t and it will be minified to mini-window)
`f` press it if your resolution is Full Hd
`q` press it if your resolution is Quad Hd 


Control focus:</br>
`win + h j k l` - left down up right

### Workspaces:

`win + shift + p` - move selected workspace to monitor <br>
`win + shift + s`  - move selected workspace to laptop screen </br>
`ctrl + shift + controls` - move windows in specific direction </br>
`ctrl + |`  - next window will be vertical    || </br>
`ctrl + '`  - next windowl will be horizontal   = </br>
                                            
### Standart:
`win + s or w or e` - tilling/stacking modes </br>
`win + q` - kill window </br>
`win + shift + r` - reload </br>

### Python:

Some handy aliases if you are coding in python:

``` env-init= python -m venv venv - initialize env``` | Create new environment</br>	
``` env-enter=source venv/bin/activate ```- Enter to the env</br>	
``` env-show=pip3 freeze --local ``` - Show dependencies in this env</br>	
``` env-install=sudo pip3 inastall -r ``` -  Install files from file</br>	
