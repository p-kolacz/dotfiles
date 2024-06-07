#!/bin/bash

# Checks if device $2 have label $3 and is mounted then sync dir $1 to it's mount point

[[ $# -eq 3 ]] || exit 1
DIR=$1
DEVICE=$2
LABEL=$3

DEV_LABEL=$(lsblk --noheadings --output LABEL "$DEVICE")
[[ $DEV_LABEL = "$LABEL" ]] || exit 0

echo "[$(date -Iseconds)] Sync started"

MOUNTPOINT=$(lsblk --noheadings --output MOUNTPOINT "$DEVICE")
echo "MOUNTPOINT: $MOUNTPOINT"
[[ -z $MOUNTPOINT ]] && exit 2

rsync --archive "$DIR" "$MOUNTPOINT"

echo "[$(date -Iseconds)] Sync ended"
