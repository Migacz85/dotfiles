#!/usr/bin/env bash

telegram-desktop 
i3-msg [class="TelegramDesktop"] move right
i3-msg [class="TelegramDesktop"] resize set 400

#If its open bring it
i3-msg [class="TelegramDesktop"] move workspace current; 
i3-msg [class="TelegramDesktop"] move right
i3-msg [class="TelegramDesktop"] resize set 400

