#!/bin/bash

mkdir -p ~/server/{crypt,static,vault}

rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/rclone-crypt.log" crypt: ~/server/crypt
rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/rclone-static.log" vault:apps/static ~/server/static
rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/rclone-vault.log" vault:files/vault ~/server/vault

