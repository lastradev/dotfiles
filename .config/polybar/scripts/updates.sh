#!/bin/bash
case $1 in
--update)
	;;
*)
	packages=$(/bin/sh -c "(/usr/bin/yay -Qqu --color never | sed 's/Get .*//') | sort -u -t' ' -k1,1" | wc -l &> /dev/null)
	echo "$packages"
	;;
esac
