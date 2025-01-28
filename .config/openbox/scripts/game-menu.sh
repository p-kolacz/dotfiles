#!/bin/bash

# Define the paths to search for .desktop files
desktop_dirs=(
    "/usr/share/applications"
    "$HOME/.local/share/applications"
)

# Loop through each directory
for dir in "${desktop_dirs[@]}"; do
    # Check if the directory exists
    if [ -d "$dir" ]; then
        # Find all .desktop files and filter for those with 'Game' in the 'Categories' field
        grep -i 'Categories=.*Game.*' "$dir"/*.desktop 2>/dev/null
    fi
done

