#!/bin/sh

nodecount() {
	bspc query --nodes --desktop .active --monitor "$MONITOR" --node .leaf | wc -l
}

nodecount
bspc subscribe node | while read -r; do
	nodecount
done

