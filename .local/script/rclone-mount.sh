#!/bin/sh

mkdir -p ~/crypt ~/vault
# umount ~/crypt
rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/rclone-crypt.log" crypt: ~/crypt
# umount ~/vault 
rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/rclone-vault.log" vault:files/vault ~/vault

