#!/bin/bash

file=/tmp/timer
if [ -f $file ]; then
	start=$(cat $file)
	now=$(date +%s)
	echo "祥 "$((start-now))s
else
	echo ""
fi

