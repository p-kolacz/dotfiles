#!/bin/bash

color=$(echo -e "red\ngreen\nblue\nwhite" | run-rofi -dmenu -p "  ")
[[ -n $color ]] && sudo msiklm $color

