# Legion 5p Problems and Fixes 5.8.18-1-MANJARO

## Problem: After reboot, I see the SDDM login screen. This is one place where I can log in. 
I'm not possible to unlock screen saver or in TTY where I see (after login attempt):

`jenpockej login: waldauf
The account is locked due to 3 failed logins.
(7 minutes left to unlock)`

Fix:

`vim /etc/security/faillock.conf` 

Set 'deny = 0'

## Touchpad not working:

1. Create this script:

`
#!/bin/bash
cd /sys/class/gpio/
echo 386 > export
cd gpio386
echo out > direction
cd ~
`

2. Change it to root
`sudo chown root:root touchpad-fix.sh` 

3. Check if its working:

`sudo touchpad-fix.sh`

4. Make it permanent:

run startup.sh using systemd:
https://www.golinuxcloud.com/run-script-at-startup-boot-without-cron-linux/


## Brightness can't be adjusted on integrated

Replace migacz with name of your user

`sudo chown migacz:migacz /sys/class/backlight/amdgpu_bl1/brightness`

## Brightness can't be adjusted on Nvidia
# -Dont do this if you plan using optimus-manager-git it will cause black screen on boot.
Create this file:
/etc/X11/xorg.conf.d/10-brightness.conf 

With: 

Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    Option         "RegistryDwords" "EnableBrightnessControl=1"
EndSection


## Not normally loud System beep when hitting backspace in some places when using linux. 

As a root:

`rmmod pcspkr ; echo "blacklist pcspkr" >>/etc/modprobe.d/blacklist.conf`


