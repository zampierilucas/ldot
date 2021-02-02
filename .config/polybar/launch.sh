#!/usr/bin/env sh

# Get computer name
computerName=`uname -n`

# Launch bar
if [[ $computerName == "revenge" ]]; then
    polybar -c ~/.config/polybar/config bottom
else
    polybar -c ~/.config/polybar/config top_linear
fi
