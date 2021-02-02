#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done#

# Get computer name
computerName=`uname -n`

# Launch bar
if [[ $computerName == "revenge" ]]; then
	~/Clone/polybar/build/bin/polybar -c ~/.config/polybar/config bottom
else
	~/Clone/polybar/build/bin/polybar -c ~/.config/polybar/config top
fi
