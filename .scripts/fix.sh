#!/bin/bash

#Touchpad fix
cd /sys/class/gpio/
echo 386 > export
cd gpio386
echo out > direction
cd ~

#GPU power control
#Nvidia
echo auto > /sys/bus/pci/devices/0000\:01\:00.0/power/control
sleep 1

#Integrated
# https://dri.freedesktop.org/docs/drm/gpu/amdgpu.html
echo "manual" > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo 1 > /sys/class/drm/card0/device/pp_dpm_mclk
echo 1 > /sys/class/drm/card0/device/pp_dpm_fclk
echo 0 > /sys/class/drm/card0/device/pp_dpm_sclk

#Fix for brightness adjustment
sleep 10
sudo chown migacz:migacz /sys/class/backlight/amdgpu_bl1/brightness
sudo chown migacz:migacz /sys/class/backlight/amdgpu_bl0/brightness
chown migacz:migacz /sys/class/backlight/nvidia_0/brightness 

#Custom scripts
bash /home/migacz/.scripts/capsesc.sh &
sleep 1
bash /home/migacz/.scripts/check_temp.sh &

