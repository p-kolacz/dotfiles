#!/bin/bash

echo "using $0"

WM=bspwm

userresources=$XDG_CONFIG_HOME/xorg/Xresources
sysresources=/etc/X11/xinit/.Xresources

[[ -f $sysresources ]] && xrdb -merge "$sysresources"
[[ -f $userresources ]] && xrdb -merge "$userresources"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# [ -n $THEME ] && xrdb -merge $HOME/.dotfiles/themes/$THEME.xresources

GPU=$("$HOME"/.local/script/gpu-detect.sh)
echo "$GPU GPU detected"
if [[ $GPU = "nvidia" ]]; then 
	xrandr --setprovideroutputsource modesetting NVIDIA-0
	xrandr --auto
fi

screenlayout="$HOME/.config/screenlayout"
[[ -f $screenlayout ]] && $screenlayout

source "$XDG_CONFIG_HOME/xorg/autostart.sh" > "$XDG_STATE_HOME/log/autostart.log" 2>&1

{ [ $WM == bspwm ] && 
	sxhkd -c ~/.config/sxhkd/global-mappings ~/.config/bspwm/wm-mappings ||
	sxhkd; } &

exec $WM > "$XDG_STATE_HOME/log/$WM.log" 2>&1
