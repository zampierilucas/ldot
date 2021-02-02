#!/bin/sh

BatterySimbol="%{T6}%{T-} "
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

for i in /sys/class/power_supply/sony_controller_battery_*; do
  if [ -d $i ]; then
    Porcentage=`cat "$i/capacity"`
    Charging=`cat "$i/status"`
  else
    Porcentage=-1
  fi
done

if [[ $Porcentage == -1 ]]; then
	echo ""
  exit 0
elif [[ $Charging == "Charging" ]]; then
  icon="%{F#ffaa00}$BatterySimbol%{F-}"
else
	if [[ $Porcentage -lt 15 ]]; then
    icon="%{F#d60606}$BatterySimbol%{F-}"
    $SCRIPTPATH/ds4led.sh 255 0 0 

  elif [[ $Porcentage -lt 20 ]]; then
		icon="%{F#f9dd04}$BatterySimbol%{F-}"
    $SCRIPTPATH/ds4led.sh 255 255 0 
	
  else
		icon="%{F#3cb703}$BatterySimbol%{F-}"
    $SCRIPTPATH/ds4led.sh 51 255 0 
	
  fi
fi

echo "$icon $Porcentage%"

