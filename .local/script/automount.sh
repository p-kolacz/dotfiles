#!/bin/sh

pathtoname() {
    udevadm info -p /sys/"$1" | awk -v FS== '/DEVNAME/ {print $2}'
}

onmount() {
	signal usb-mounted "$1" &
	LABEL=$(lsblk --noheadings --output LABEL "$1")
	notify-send "UDisks" "$LABEL ($1) mounted"
}

onremove() {
	notify-send "UDisks" "Disk removed"
}

stdbuf -oL -- udevadm monitor --udev -s block | while read -r -- _ _ event devpath _; do
	if [ "$event" = add ]; then
		devname=$(pathtoname "$devpath")
		udisksctl mount --block-device "$devname" --no-user-interaction && onmount "$devname"
	elif [ "$event" = remove ]; then
		onremove "$devpath"
	fi
done

