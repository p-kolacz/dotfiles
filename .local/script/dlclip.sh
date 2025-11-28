#!/bin/bash

# Downloads youtube movie using URL from clipboard

URL=$(xclip -selection clipboard -o)

if [[ $URL =~ ^https?://[a-zA-Z0-9.-]+(\.[a-zA-Z]{2,})+([/?.#][^ ]*)?$ ]]; then
	notify-send "YTDL" "Downloading: $URL"
	yt-dlp --no-playlist "$URL"
	notify-send "YTDL" "Download complete"
else
	notify-send --urgency=critical "YTDL" "$URL is not a valid URL"
fi

