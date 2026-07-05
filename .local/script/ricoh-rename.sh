#!/bin/bash

shopt -s nullglob nocaseglob

for file in R*.JPG R*.DNG IMG2*.JPG; do
    # Skip if not a regular file (just in case)
    [[ -f "$file" ]] || continue

    # Get modification time in desired format
    timestamp=$(date -r "$file" +"%Y%m%d_%H%M%S")

    # Extract extension and normalize to lowercase
    ext="${file##*.}"
    ext="${ext,,}"

    # Build new filename
    new_name="IMG_${timestamp}.${ext}"

    # Handle potential name collisions
    counter=1
    while [[ -e "$new_name" ]]; do
        new_name="IMG_${timestamp}_$counter.${ext}"
        ((counter++))
    done

    # Rename file
    mv -v "$file" "$new_name"
done
