#!/bin/bash

[[ $# -eq 1 ]] || exit 1

DEVICE=$1
MOUNTPOINT=$(lsblk --noheadings --output MOUNTPOINT "$DEVICE")
[[ -z $MOUNTPOINT ]] && exit 2

HOSTNAME=$(cat /etc/hostname)
[[ -z $HOSTNAME ]] && exit 3

RUNFILE="$MOUNTPOINT/$HOSTNAME.sh"
[[ -e $RUNFILE ]] || exit 0 

echo "[$(date -Iseconds)] $RUNFILE found, executing"
# notify-send "BashBus" "Auto sync started"

bash "$RUNFILE"

echo "[$(date -Iseconds)] $RUNFILE execution completed"
# notify-send "BashBus" "Auto sync completed"

