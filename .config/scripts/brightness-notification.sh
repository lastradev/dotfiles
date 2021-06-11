#!/bin/bash

brightness="/sys/class/backlight/acpi_video0/brightness"
presbright=`cat /sys/class/backlight/acpi_video0/brightness`
perc=`expr $presbright "*" 100 "/" 49`

case "$1" in
	up)
	  echo $(( ${presbright}+5 )) > $brightness
	  notify-send "Brightness Up" -i notification-display-brightness-low -h int:value:$perc -h string:x-canonical-private-synchronous:brightness &
	;;
	down)
	  echo $(( ${presbright}-5 )) > $brightness
	  notify-send "Brightness Down" -i notification-display-brightness-low -h int:value:$perc -h string:x-canonical-private-synchronous:brightness &
	;;
	status)
	  echo $presbright
	;;
	*)
	  echo "Accepted arguments are: up, down, status."
	;;
esac

exit 0
