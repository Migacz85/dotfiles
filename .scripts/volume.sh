#!/usr/bin/env bash
set -euo pipefail

volume=$(cat /sys/class/backlight/amdgpu_bl0/brightness) &&
volume=$(awk -F'[][]' '{ print $2 }' <(amixer sget Master) | awk 'END{print}') &&

notify-send -a 'Volume' "$volume"  -h string:x-canonical-private-synchronous:anything
