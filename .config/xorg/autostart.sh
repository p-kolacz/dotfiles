#!/bin/sh

# "$DOTFILES/xorg/monitor-setup.sh" > "$XDG_STATE_HOME/xrandr.log"
wallpaper restore &
picom -b
setxkbmap -option caps:escape
kbrate.sh
bluetoothctl power on &
numlockx &

