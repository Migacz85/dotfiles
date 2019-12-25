#Fixes

cat >>~/.bashrc <<EOL
 if [ -f ~/.bash_profile ]; then
 source ~/.bash_profile
 fi
 if [ -f /etc/bashrc ]; then
         . /etc/bashrc
 fi
 if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
 fi
EOL

# # Fix touchpad in i3
# sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
#             Section "InputClass"
#             Identifier "touchpad"
#             MatchIsTouchpad "on"
#             Driver "libinput"
#             Option "Tapping" "on"
#  EndSection
# EOF
# cat >/etc/asound.conf <<EOL
# pcm.bluetooth {
#     type bluetooth
#     device 68:DB:F5:5D:42:E2 # change this MAC address to the one you wrote down
# }
# EOL
