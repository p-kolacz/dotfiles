#!/bin/sh

setxkbmap -option caps:escape
# xset r rate 300 40
ID=$(xinput list | awk -v FPAT='id=|[0-9]+' '/Ergo.*pointer/ {print $2}')
xinput set-prop "$ID" "libinput Accel Profile Enabled" 0 1
