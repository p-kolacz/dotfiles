#!/bin/sh

reset-input.sh
wallpaper restore &
picom -b
xplugd &
automount.sh &
