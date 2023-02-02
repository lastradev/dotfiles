#!/bin/sh

battery_print() {
	PATH_AC="/sys/class/power_supply/AC"
	PATH_BATTERY="/sys/class/power_supply/BAT0"

	ac=0
	battery_level=0
	battery_max=0

	if [ -f "$PATH_AC/online" ]; then
		ac=$(cat "$PATH_AC/online")
	fi

	if [ -f "$PATH_BATTERY/charge_now" ]; then
		battery_level=$(cat "$PATH_BATTERY/charge_now")
	fi

	if [ -f "$PATH_BATTERY/charge_full" ]; then
		battery_max=$(cat "$PATH_BATTERY/charge_full")
	fi

	battery_percent=$(("$battery_level * 100"))
	battery_percent=$(("$battery_percent / $battery_max"))

	if [ "$ac" -eq 1 ]; then
		icon="%{F#94e2d5}%{F-}"
	elif [ "$battery_percent" -gt 90 ]; then
		icon="%{F#a6e3a1}%{F-}"
	elif [ "$battery_percent" -gt 75 ]; then
		icon="%{F#92e2d5}%{F-}"
	elif [ "$battery_percent" -gt 50 ]; then
		icon="%{F#f9e2af}%{F-}"
	elif [ "$battery_percent" -gt 30 ]; then
		icon="%{F#fab387}%{F-}"
	elif [ "$battery_percent" -gt 10 ]; then
		icon="%{F#eba0ac}%{F-}"
	else
		icon="%{F#f38ba8}%{F-}"
	fi

	echo "%{T2}$icon %{T-}$battery_percent%"
}

path_pid="/tmp/polybar-battery-combined-udev.pid"

case "$1" in
--update)
	pid=$(cat $path_pid)

	if [ "$pid" != "" ]; then
		kill -10 "$pid"
	fi
	;;
*)
	echo $$ >$path_pid

	trap exit INT
	trap "echo" USR1

	while true; do
		battery_print

		sleep 1 &
		wait
	done
	;;
esac
