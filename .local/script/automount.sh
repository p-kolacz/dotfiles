#!/bin/sh

pathtoname() {
    udevadm info -p /sys/"$1" | awk -v FS== '/DEVNAME/ {print $2}'
}

stdbuf -oL -- udevadm monitor --udev -s block | while read -r -- _ _ event devpath _; do
	if [ "$event" = add ]; then
		devname=$(pathtoname "$devpath")
		udisksctl mount --block-device "$devname" --no-user-interaction && notify-send -i "$HOME/.local/share/icons/arch.svg" "UDisks" "$devname mounted"
	elif [ "$event" = remove ]; then
		notify-send -i "$HOME/.local/share/icons/arch.svg" "UDisks" "$devname removed"
	fi
done

