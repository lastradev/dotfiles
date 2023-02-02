#!/usr/bin/bash

# Brightness notification: dunst


icon_path=/usr/share/icons/Adwaita/32x32/status/
notify_id=817

brightness="/sys/class/backlight/amdgpu_bl0/brightness"
presbright=`cat /sys/class/backlight/amdgpu_bl0/brightness`
perc=`expr $presbright "*" 100 "/" 49`

function get_brightness {
    xbacklight -get
}

function brightness_notification {
    brightness=`get_brightness`
    printf -v br_int %.0f "$brightness"
    echo $br_int
    bar=$(seq -s "─" $(($br_int / 5)) | sed 's/[0-9]//g')
    dunstify -r $notify_id -t 1000 -u low -i 0 "🔆 $bar"
}

case $1 in
    up)
        # xbacklight -inc 20
        echo $(( ${presbright}+20 )) > $brightness
        brightness_notification
        ;;
    down)
        # xbacklight -dec 20
        echo $(( ${presbright}-20 )) > $brightness
        brightness_notification
	    ;;
    *)
        echo "Usage: $0 up | down "
        ;;
esac
