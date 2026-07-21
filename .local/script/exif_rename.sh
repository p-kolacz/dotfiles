#!/usr/bin/env bash

for file in "$@"; do
	if [[ ! -f "$file" ]]; then
		echo "Skipping '$file' (not a regular file)"
		continue
	fi

	create_date=$(exiftool -s3 -d '%Y%m%d_%H%M%S' -CreateDate "$file")

	if [[ -z "$create_date" ]]; then
		echo "Skipping '$file' (no CreateDate)"
		continue
	fi

	dir="$(dirname "$file")"
	filename="$(basename "$file")"

	# # Preserve original extension (including case)
	# if [[ "$filename" == *.* ]]; then
	# 	ext=".${filename##*.}"
	# else
	# 	ext=""
	# fi

    # Extract extension and normalize to lowercase
    ext="${filename##*.}"
    ext="${ext,,}"

	base_name="IMG_${create_date}"
	new_path="${dir}/${base_name}.${ext}"

	# Skip if filename is already correct
	if [[ "$(basename "$file")" == "$(basename "$new_path")" ]]; then
		echo "Skipping '$file' (already named correctly)"
		continue
	fi

	counter=1
	while [[ -e $new_path ]]; do
		new_path="${dir}/${base_name}_${counter}.${ext}"
		((counter++))
	done

	mv -v -- "$file" "$new_path"
	# echo "Renamed '$file' -> '$(basename "$new_path")'"
done
