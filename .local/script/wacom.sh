#!/bin/bash

stylus_id=$(xsetwacom list devices | grep stylus | cut -f2 | cut -d ' ' -f2)
pad_id=$(xsetwacom list devices | grep pad | cut -f2 | cut -d ' ' -f2)

xsetwacom set $pad_id Button 1 3	# RMB
xsetwacom set $pad_id Button 2 "key +f2"
xsetwacom set $pad_id Button 3 "key +ctrl z -ctrl"
xsetwacom set $pad_id Button 8 "key +ctrl y -ctrl"

xsetwacom set $stylus_id Button 2 "key +f11"
xsetwacom set $stylus_id Button 3 "key +f12"

# TODO: uniezależnić od karty graficzniej i podłączonego monitora
xsetwacom set $stylus_id MapToOutput DP-3
