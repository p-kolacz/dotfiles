#!/bin/bash

shopt -s nullglob

for file in R*.JPG; do
	# Get modification time in desired format
	timestamp=$(date -r "$file" +"%Y%m%d_%H%M")

	# Build new filename
	new_name="IMG_${timestamp}.jpg"

	# Handle potential name collisions
	counter=1
	while [[ -e "$new_name" ]]; do
		new_name="IMG_${timestamp}_$counter.jpg"
		((counter++))
	done

	# Rename file
	mv -v "$file" "$new_name"
done
