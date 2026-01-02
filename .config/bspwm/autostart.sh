#!/bin/sh

setxkbmap -option caps:escape
numlockx
xset r rate 300 40
wallpaper restore &
picom -b
xplugd &
automount.sh &
