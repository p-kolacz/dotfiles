#!/bin/bash

ICONS=(󰎣 󰎦 󰎩 󰎬 󰎮 󰎰 󰎵 󰎸 󰎻 󰎾 󰏁)

nodecount() {
	local count
	count=$(bspc query --nodes --desktop .active --monitor "$MONITOR" --node .leaf.!hidden | wc -l)
	[[ $count -gt 9 ]] && echo "${ICONS[10]}" || echo "${ICONS[$count]}"
}

nodecount
bspc subscribe node | while read -r; do
	nodecount
done

