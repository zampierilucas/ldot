#!/bin/bash

# Update current in use interface
export DEFAULT_NETWORK_INTERFACE=`ip route | grep '^default' | awk '{print $5}' | head -n1`

# Close to reload
killall -9 sxhkd
killall -9 polybar

sxhkd &
sh ~/.config/polybar/launch.sh
sh ~/.config/bspwm/java_non-repeting_window_fix.sh
