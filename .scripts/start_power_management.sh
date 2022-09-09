#!/usr/bin/env bash
running_test="$( ps -efww | grep '[b]ash /home/migacz/stats/scripts/power_management.sh' )"
    if [[ ! -z $running_test ]]; then
        echo "[$(date)] : Process is already running with PID $pid"
        exit 1
    else
    bash power_management.sh
    fi

