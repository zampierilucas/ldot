#!/bin/sh

HOST=8.8.8.8
PingSimbol=""

PingOutput=`ping -c1 $HOST 2>&1`

Connection=`echo $PingOutput | grep -e "failure" -e "100% packet" -e "fora de alcance" -e "Falha temporário" -e "unreachable"`
PingTime=`echo $PingOutput | sed -rn 's/.*[tempo|time]=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p'`

if [ ! "$Connection" = "" ]; then
	echo "%{F#666666} ping failed%{F-}"
else
	if [ "$PingTime" -lt 50 ]; then
		icon="%{F#3cb703}$PingSimbol%{F-}"
	elif [ "$PingTime" -lt 150 ]; then
		icon="%{F#f9dd04}$PingSimbol%{F-}"
	else
		icon="%{F#d60606}$PingSimbol%{F-}"
	fi

	echo "$icon $PingTime ms"
fi
