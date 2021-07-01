#!/usr/bin/env bash
set -euo pipefail

i3-msg [class='qutebrowser'] focus &&
xdotool type :devtools &&
xdotool key Return
xdotool key Return
