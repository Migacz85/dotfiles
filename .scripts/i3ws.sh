#!/usr/bin/env bash

if [[ $1 == "current" ]]; then
i3-msg '[tilling]' move workspace current
i3-msg '[instance="youtube-list"]' move to scratchpad
i3-msg '[instance="ranger"]' move to scratchpad
fi

time=0.1

if [[ $1 == "konsole" ]]; then

    i3-msg '[title="terminal0"]' move workspace current
    i3-msg '[title="terminal0"]' focus

    i3-msg split v
    i3-msg move left

    i3-msg '[title="terminal1"]' move workspace current
    i3-msg '[name="terminal1"]' focus

    i3-msg '[title="terminal2"]' move workspace current
    i3-msg '[title="terminal2"]' focus

    i3-msg '[title="terminal3"]' move workspace current
    i3-msg '[title="terminal3"]' focus

    # #This should be done by split.sh - but somehow it not work that way
    # i3-msg split v
    # i3-msg move left

    i3-msg '[title="terminal4"]' move workspace current
    i3-msg '[instance="terminal4"]' focus

    i3-msg '[title="terminal5"]' move workspace current
    i3-msg '[instance="terminal5"]' focus

    i3-msg move left
fi


if [[ $1 == "order" ]]; then

i3-msg '[class="Thunderbird"]' move workspace "11";
i3-msg '[class="emacs"]' move workspace "6";
i3-msg '[class="qutebrowser"]' move workspace "5";
i3-msg '[class="URxvt"]' move workspace "1" ;
i3-msg '[class="TelegramDesktop"]' move workspace "12" ;
# i3-msg '[class="URxvt" title="ranger"]' move workspace  ;
i3-msg '[class="URxvt" title="vim"]' move workspace "6" ;
i3-msg '[class="Chromium"]' move workspace "8" ;
i3-msg '[class="127.0.0.1"]' move workspace "5" ;

# i3-msg '[class="vlc" ]' move workspace 13

i3-msg '[instance="youtube-list"]' move to scratchpad
i3-msg '[instance="ranger"]' move to scratchpad

fi

