#!/bin/sh

BatterySimbol="%{T6}%{T-}"

Porcentage=`headsetcontrol -b 2>&1 | sed -rn 's/.*Battery: //p' 2>&1`

if [ "$Porcentage" == "" ]; then
	echo ""
elif [ "$Porcentage" == "Charging" ]; then
  icon="%{F#ffaa00}$BatterySimbol%{F-}"
else
	if [ "${Porcentage//%}" -lt 15 ]; then
    icon="%{F#d60606}$BatterySimbol%{F-}"
	elif [ "${Porcentage//%}" -lt 20 ]; then
		icon="%{F#f9dd04}$BatterySimbol%{F-}"
	else
		icon="%{F#3cb703}$BatterySimbol%{F-}"
	fi
fi

echo "$icon $Porcentage"
