#!/bin/sh

setxkbmap -option caps:escape
xset r rate 300 40
xinput set-prop 8 "libinput Accel Profile Enabled" 0 1
