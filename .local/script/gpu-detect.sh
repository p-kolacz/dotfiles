#!/bin/sh

if xrandr | grep -q "eDP-1 connected"; then
	echo "intel"
else
	echo "nvidia"
fi
