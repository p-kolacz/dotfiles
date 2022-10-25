#!/bin/bash

# TODO: change hardcoding
# $DOTFILES/share/screenlayout/Workbook-Desktop.sh
exit 1

xrandr_output=$(xrandr)

if echo "$xrandr_output" | grep -q "eDP-1 connected"; then   # Intel GPU
	# internal=eDP-1
	central=DP-3
	# right=HDMI-2
	gpu=intel
else  # nVidia GPU
	# internal=eDP-1-1
	central=DP-1-3
	# right=HDMI-1-2
	gpu=nvidia
	xrandr --setprovideroutputsource modesetting NVIDIA-0
fi

echo $gpu > /tmp/gpu
echo $gpu

if echo $xrandr_output | grep -q "$central disconnected"; then    # mobile mode
	$DOTFILES/share/screenlayout/$gpu-Internal-Only.sh
else    # docked mode
	$DOTFILES/share/screenlayout/$gpu-K25-Desktop-Full.sh
fi

