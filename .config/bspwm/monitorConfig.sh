#!/bin/sh


clean () {
    echo "cleaning"
    sudo pkill -f barrier
    sudo pkill -f synergy
    sudo sed -i '/default-server/d' /etc/pulse/client.conf
}

work () {
    echo "Work mode"
    curr_display_cfg="work"
    clean
#    sh ~/.config/screenlayout/workconfig.sh
    sudo synergys -f --no-tray --debug INFO -c ~/.config/Synergy/config_work --address :24800 --serial-key $SYNERGY_KEY > /dev/null &
    pacmd load-module module-null-sink sink_name=MySink channels=2
    pacmd update-sink-proplist MySink device.description=MySink
    sudo chown $USER /etc/pulse/client.conf
    sudo echo "default-server = 192.168.0.251" >> /etc/pulse/client.conf
    sudo ddccontrol dev:/dev/i2c-6 -r 0x60 -w 03 >> /dev/null &
    bspc wm -r
}

home () {
    echo "Home mode"
    curr_display_cfg="work"
    clean
    sh ~/.config/screenlayout/homeconfig.sh
    sudo ddccontrol dev:/dev/i2c-6 -r 0x60 -w 17 >> /dev/null &
    bspc wm -r
}

export curr_display_cfg
