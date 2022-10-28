#!/bin/bash

# Script arguments
FILE_PATH="$1"         # Full path of the highlighted file
PV_WIDTH="$2"          # Width of the preview pane (number of fitting characters)
PV_HEIGHT="$3"         # Height of the preview pane (number of fitting characters)

# lf mode
[[ -z $PV_HEIGHT ]] && PV_HEIGHT=$PV_WIDTH && PV_WIDTH=80

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION="${FILE_EXTENSION,,}"

limit() {
	head -n "$PV_HEIGHT" "$1"
}

syn_highlight() {
	# highlight -O xterm256 -s "base16/nord" --force "$1"
	highlight -O xterm256  --force "$1"
}

binary() {
	FILE_PATH="$1"
	[[ -s $FILE_PATH ]] && hexyl --length=512 --no-position --no-squeezing "$FILE_PATH"
}

file --brief --dereference "$FILE_PATH" && echo "────────────────────────────────────────"

case "$FILE_EXTENSION" in

	bmp|gif|ico|jpg|jpeg|png|tiff|webp)
		mediainfo "$FILE_PATH" && exit 0 ;;

	ape|flac|mp3|ogg|wav)
		mediainfo "$FILE_PATH" && exit 0 ;;

	it|mod|s3m|xm)
		mediainfo "$FILE_PATH" && exit 0 ;;

	pdf)
		pdftotext -l 10 -nopgbrk -q -- "$FILE_PATH" - && exit 0;;

	odt|ods|odp)
		odt2txt "$FILE_PATH" && exit 0 ;;

	doc)
		catdoc "$FILE_PATH" && exit 0;;

	xls)
		xls2csv "$FILE_PATH" && exit 0 ;;

	docx)
		docx2txt.pl "$FILE_PATH" - && exit 0;;

	csv)
		echo -n "Lines: "
		wc -l < "$FILE_PATH"
		limit "$FILE_PATH" | xsv table && exit 0;;

	3gp|avi|flv|m4v|mkv|mov|mp4|mpg|mpeg|ogv|qt|vob|webm|wmv)
		mediainfo "$FILE_PATH" && exit 0 ;;

	7z|apk|bz|bz2|cab|deb|epub|gz|jar|rar|rpm|tar|tgz|xz|zip)
		bsdtar --list --file "$FILE_PATH" && exit 0;;

esac

if file --dereference --mime-encoding "$FILE_PATH" | grep -q binary; then
	binary "$FILE_PATH" 
else
	syn_highlight "$FILE_PATH"
fi

