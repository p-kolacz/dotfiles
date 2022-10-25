#!/bin/bash
delay=0.5 # seconds

id=$2

# shm="/dev/shm/btn-held-status-$id"
shm="/tmp/btn-held-status-$id"

case $1 in
	press)
		echo "press" > "$shm"
		sleep $delay

		read -r line < "$shm"
		if [ "$line" = "press" ]; then
			echo "idle" > "$shm"
			xdotool key "$3"
		fi
		;;
	release)
		read -r line < "$shm"
		if [ "$line" = "press" ]; then
			echo "idle" > "$shm"
			# xdotool key "$3"
		fi
		;;
	*)
		echo "Usage: ${0##*/} [press|release] button-id key-to-emit"
esac
