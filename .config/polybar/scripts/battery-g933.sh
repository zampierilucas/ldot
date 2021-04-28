#!/bin/sh

BatterySimbol="%{T6}%{T-}"

Porcentage=`~/.config/polybar/scripts/g933-utils get battery | awk '{print $2}'`
chargingData=`~/.config/polybar/scripts/g933-utils get battery | awk '{print $3}'`
isCharging=`[[ "$chargingData" == "[discharging]" ]] && echo false || echo true`

if [ "$Porcentage" == "" ]; then
	echo ""
elif [ "$isCharging" == "true" ]; then
  icon="%{F#ffaa00}$BatterySimbol%{F-}"
else
	if [ "${Porcentage%%.*}" -lt 15 ]; then
    icon="%{F#d60606}$BatterySimbol%{F-}"
	elif [ "${Porcentage%%.*}" -lt 20 ]; then
		icon="%{F#f9dd04}$BatterySimbol%{F-}"
	else
		icon="%{F#3cb703}$BatterySimbol%{F-}"
	fi
fi

echo "$icon $Porcentage"
