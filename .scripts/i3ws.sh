#!/usr/bin/env bash

if [[ $1 == "current" ]]; then
i3-msg '[class=".*"]' move workspace current
i3-msg '[instance="youtube-list"]' move to scratchpad
i3-msg '[instance="ranger"]' move to scratchpad
fi

time=0.1

if [[ $1 == "konsole" ]]; then

    i3-msg '[instance="terminal0"]' move workspace current
    i3-msg '[instance="terminal0"]' focus
    bash split.sh
    sleep $time

    i3-msg '[instance="terminal1"]' move workspace current
    i3-msg '[instance="terminal1"]' focus
    bash split.sh
    sleep $time

    i3-msg '[instance="terminal2"]' move workspace current
    i3-msg '[instance="terminal2"]' focus

    # #This should be done by split.sh - but somehow it not work that way
    # i3-msg split v
    # i3-msg move left

    bash split.sh
    sleep $time

    i3-msg '[instance="terminal3"]' move workspace current
    i3-msg '[instance="terminal3"]' focus

    # #This should be done by split.sh - but somehow it not work that way
    # i3-msg split v
    # i3-msg move left

    bash split.sh
    sleep $time

    i3-msg '[instance="terminal4"]' move workspace current
    i3-msg '[instance="terminal4"]' focus

# i3-msg '[title="vim"]' move container to workspace "7"
i3-msg '[instance="youtube-list"]' move to scratchpad
i3-msg '[instance="ranger"]' move to scratchpad
fi


if [[ $1 == "order" ]]; then

i3-msg '[class="Thunderbird"]' move workspace "11";
i3-msg '[class="code-oss"]' move workspace "7";
i3-msg '[class="qutebrowser"]' move workspace "2";
i3-msg '[class="URxvt"]' move workspace "1" ;
i3-msg '[class="TelegramDesktop"]' move workspace "12" ;
# i3-msg '[class="URxvt" title="ranger"]' move workspace  ;
i3-msg '[class="URxvt" title="vim"]' move workspace "6" ;
i3-msg '[class="Chromium"]' move workspace "5" ;
i3-msg '[class="127.0.0.1"]' move workspace "5" ;

# i3-msg '[class="vlc" ]' move workspace 13

i3-msg '[instance="youtube-list"]' move to scratchpad
i3-msg '[instance="ranger"]' move to scratchpad

fi

