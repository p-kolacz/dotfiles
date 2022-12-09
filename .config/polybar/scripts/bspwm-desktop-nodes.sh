#!/bin/sh

nodecount() {
	bspc query --nodes --desktop .active --monitor "$MONITOR" --node .leaf.!hidden | wc -l
}

nodecount
bspc subscribe node | while read -r; do
	nodecount
done

