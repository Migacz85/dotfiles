<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**
- [I3wm Config Files](#i3wm-config-files)
    - [About](#about)
    - [Installation](#installation)
    - [Tilling](#tilling)
    - [I3wm shortcuts for floating windows](#i3wm-shortcuts-for-floating-windows)
    - [Display Brightness and temperature](#display-brightness-and-temperature)
    - [External monitor](#external-monitor)
    - [Themes changing](#themes-changing)
    - [Moving windows](#moving-windows)
    - [Bring windows](#bring-windows)
    - [Mini-window](#mini-window)
    - [Workspaces:](#workspaces)
    - [Standart:](#standart)
    - [Python:](#python)
<!-- markdown-toc end -->
# I3wm Config Files
## About    
This repository will help you with the installation of i3wm on fresh
manjaro installation. It should install i3wm along with all dotfiles,
setup vim, and doom emacs. This repo contains also a few useful scripts to
deal with i3wm, like changing escape with capslock. Or mini-window to 
play videos in a small window while you working

Ranger with devicons, Kawase-blur, and bat.
![File manager](https://i.imgur.com/VrcmI9v.jpg) 
Youtube with kawase-blur and mini-window script
![Youtube](https://i.imgur.com/ZdZKUfn.jpg) 
Tilling look
![Tilling in i3wm](https://i.imgur.com/YsTHa6S.png)
Htop with kawase-blur
![Htop](https://i.imgur.com/lC4KLQ6.png)
Qutebrowser with kawase-blur and solarized-everything-css
![Qutebrowser](https://i.imgur.com/p8NhOkL.png)

## Installation


Firstly go to https://manjaro.org/download/ and download and install manjaro with the flavor you
like. When you will have fresh installation just run:

1. Manually rename `.bash_profile`, `.profile`, `.Xresources` for backup

2. Please inspect script setup-env.sh before running. Maybe you don't want to
install specific apps. - Simply delete installation lines before running.

3. 
`bash
git clone https://github.com/Migacz85/dotfiles.git
cd dotfiles 
bash setup-env.sh
`
<s 

The script should install & setup:
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
-  install doom
  
## Tilling

This "feature" relay on `split.sh` script.

By default windows will start opening in a matrix way:

- | 1 | 2 |
- | 4 | 3 |

If you don't like it, edit `split.sh` and find the variable:

- `choice="matrix"`

and change it to

- `choice="none"`

and windows will split like in standard i3wm

| 1 | 2 | 3 | 4 |

- `win + |` spliting verticaly
- `win + '` spliting horizontaly

however is not perfect, and it works only when new windows are created.

## I3wm shortcuts for floating windows

 - F1 - Open floating ranger
 - F2 - Toggle clipboard 
 - F3 - Youtube
 - F4 - HTOP 
 - F12 - Quake terminal

`win + d` - open programs <br>

## Display Brightness and temperature

- `win + shift 3 and 4` control brightness
- `win + shift 5 and 6` control redshift 
- `win + shift 7 and 8` control gaps between windows 

## External monitor

- `mod + Shift + m` Modes for setting external monitor 

- laptop screen
- laptop and external monitor
- only external monitor

Inspect `external_monitor.sh` script, run xrandr on your device. 
And change these variables in an appropriate way:

`EXTERNAL_OUTPUT="HDMI1"
INTERNAL_OUTPUT="eDP1"`

## Themes changing

`win + t` - will open change theme mode
`p` - setup previous wallpaper (located in ~/.wallpapers) 
`n` - setup next wallpaper
`l` - set fonts colors in terminal to light mode (keep pressing will setup new colors)
`d` - set fonts colors in terminal to dark mode (keep pressing will setup new colors)
`k` - kill compton (if you want extra CPU power you can do that)
`c` - turn on compton (it will turn on compton with kawase blur) - turn on by default

`esc` - go out from mode

This mode is using `wall.sh` script. Located in folder `/.scripts`

## Moving windows

`win + m` will open mode move
`1` will move the window to workspace 1
`2` will move the window to workspace 2
...

`9` will move the window to workspace 9

## Bring windows

`win + b` will open mode bring (it will bring the window to current workspace)
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

## Mini-window 

This mode relay on `bottomright.sh` script

`win + n` turn on mini-window mode
`n` put the window in the next corner
`s` constantly pressing will change the size of mini-window
`t` toggle between floating and tilling 
`y` open youtube in app mode (you can press after t and it will be minified to mini-window)
`f` press it if your resolution is Full Hd
`q` press it if your resolution is Quad Hd 


Control focus:</br>
`win + h j k l` - left down up right

## Workspaces:

`win + shift + p` - move selected workspace to monitor <br>
`win + shift + ;`  - move selected workspace to laptop screen </br>
`ctrl + shift + controls` - move windows in specific direction </br>
`ctrl + |`  - next window will be vertical    || </br>
`ctrl + '`  - next windowl will be horizontal   = </br>
                                            
## Standart:
`win + s or w or e` - tilling/stacking modes </br>
`win + q` - kill window </br>
`win + shift + r` - reload </br>

## Python:
Some handy aliases if you are coding in python:

``` env-init= python -m venv venv - initialize env``` | Create new environment</br>	
``` env-enter=source venv/bin/activate ```- Enter to the env</br>	
``` env-show=pip3 freeze --local ``` - Show dependencies in this env</br>	
``` env-install=sudo pip3 inastall -r ``` -  Install files from file</br>	
