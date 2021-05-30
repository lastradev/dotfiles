#!/bin/bash

presbright=`cat /sys/class/backlight/acpi_video0/brightness`
perc=`expr $presbright "*" 100 "/" 49`

case "$1" in
  up) notify-send "Brightness Up" -i notification-display-brightness-low -h int:value:$perc -h string:x-canonical-private-synchronous:brightness ;;
  down) notify-send "Brightness Down" -i notification-display-brightness-low -h int:value:$perc -h string:x-canonical-private-synchronous:brightness ;;
  *) notify-send "blabla" ;;
esac

exit 0
