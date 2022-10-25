#!/bin/bash

CLASSNAME=scratchpad

id=$(xdotool search --classname $CLASSNAME)
if [[ -n $id ]]; then
	bspc node "$id" --flag hidden --focus
else
	$TERMINAL --class $CLASSNAME &
fi

