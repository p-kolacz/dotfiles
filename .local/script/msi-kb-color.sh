#!/bin/bash

color=$(echo -e "red\ngreen\nblue\nwhite" | rofi -dmenu -p "  ")
[[ -n $color ]] && sudo msiklm $color

