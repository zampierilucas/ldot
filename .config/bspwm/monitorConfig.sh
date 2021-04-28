#!/bin/sh


clean () {
    echo "cleaning"
    systemctl --user stop jack.service
    systemctl --user stop jacktrip.service
    systemctl --user stop synergy.service
}

work () {
    echo "Work mode"
    clean
    systemctl --user start synergy.service
    systemctl --user start jack.service
    systemctl --user start jacktrip.service
    sleep 1
    jack_connect system:capture_1 JackTrip:send_2 &
    sudo ddccontrol dev:/dev/i2c-9 -r 0x60 -w 17 &>/dev/null
    sudo ddccontrol dev:/dev/i2c-8 -r 0x60 -w 17 &>/dev/null
    bspc wm -r
}

home () {
    echo "Home mode"
    clean
    sh ~/.config/screenlayout/homeconfig.sh
    sudo ddccontrol dev:/dev/i2c-9 -r 0x60 -w 15 &>/dev/null
    sudo ddccontrol dev:/dev/i2c-8 -r 0x60 -w 15 &>/dev/null
    bspc wm -r
}

