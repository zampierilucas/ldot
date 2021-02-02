#!/bin/bash
# This isn't really that safe to blindly run,
# as it uses sudo to change system file permissions.
# Hopefully it shouldn't break anything though.
# Usage: ds4led [r value] [g value] [b value]
# or `ds4led orange` to set it to orange.

DS4="000*:054C:*"

cd /sys/class/leds
FILES=("$DS4:*/brightness")
for FILE in $FILES; do
	if [[ $(stat -c "%a" $FILE) != 777 ]]; then
		sudo chmod 777 $FILE
	fi
done

if [[ $# > 0 ]]; then
	if [[ "$1" -eq "orange" ]]; then
		echo 150 > $DS4:red/brightness
		echo 50 > $DS4:green/brightness
		echo 0 > $DS4:blue/brightness
	else
		echo $1 > $DS4:red/brightness
	fi
fi
if [[ $# > 1 ]]; then
	echo $2 > $DS4:green/brightness
fi
if [[ $# > 2 ]]; then
	echo $3 > $DS4:blue/brightness
fi
