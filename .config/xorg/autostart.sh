#!/bin/sh

# "$DOTFILES/xorg/monitor-setup.sh" > "$XDG_STATE_HOME/xrandr.log"
kbreset
wallpaper restore &
picom -b
# bluetoothctl power on &
xplugd &
automount.sh &
