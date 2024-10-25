#!/bin/bash

brama=$(hass-state.sh binary_sensor.brama_opening | jq .state)
drzwi=$(hass-state.sh binary_sensor.drzwi_opening | jq .state)

[[ $brama = '"off"' ]] && echo -n "󰊙 " || echo -n "󱅪 "
echo -n " "
[[ $drzwi = '"off"' ]] && echo -n " " || echo -n " "

