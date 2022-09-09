#!/bin/bash

charge=$(upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage" | awk  'NR==2 { print $2}')
charge=${charge::2}
voltage=$(($(cat /sys/class/power_supply/BAT0/power_now) / 1000000))

# echo "Battery: $charge%" 
# echo "Discharge [v]: $discharge "
state=$(acpi)
percent=${state:21:3}
state=${state:11:4}

if [[ $state == "Char"  ]]; then
    if [[ $percent == "100"  ]]; then
    echo "Full"
    fi

time=$(acpi)
echo 🌩 ${time:25:9}

fi

if [[ $state == "Disc"  ]]; then
time=$(acpi)
echo 🔋 ${time:29:9}
fi
