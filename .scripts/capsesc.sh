#!/bin/bash

xmodmap -e 'clear lock' -e 'keycode 66 = Escape'
xmodmap -e 'keycode 9 = Caps_Lock NoSymbol Caps_Lock'
