#!/bin/bash
cd /sys/class/gpio/
echo 386 > export
cd gpio386
echo out > direction
cd ~
echo auto > /sys/bus/pci/devices/0000\:01\:00.0/power/control


bash /home/migacz/.scripts/capsesc.sh &
bash /home/migacz/.scripts/check_temp.sh &

sleep 10
sudo chown migacz:migacz /sys/class/backlight/amdgpu_bl1/brightness
sudo chown migacz:migacz /sys/class/backlight/amdgpu_bl0/brightness
