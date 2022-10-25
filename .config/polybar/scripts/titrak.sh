#!/bin/bash

file="$HOME/.cache/titrak"
[[ -s $HOME/.cache/titrak ]] && echo "羽 "$(basename $(cat "$file")) || echo ""

