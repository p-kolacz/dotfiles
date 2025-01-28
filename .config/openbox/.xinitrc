#!/bin/bash

echo "Staring Openbox..."

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

openbox-session > "$XDG_STATE_HOME"/log/openbox.log 2>&1
