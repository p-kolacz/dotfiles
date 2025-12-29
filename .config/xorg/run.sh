#!/bin/sh

LOGFILE=$XDG_STATE_HOME/log/startx.log
XINITRC=${1:-$XDG_CONFIG_HOME/xorg/.xinitrc}

echo "Using XINITRC: $(realpath "$XINITRC")" > "$LOGFILE"

if [ -z "${DISPLAY}" ]; then
	startx "$XINITRC" >> "$LOGFILE" 2>&1
fi
