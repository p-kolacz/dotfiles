#!/bin/bash

mkdir -p ~/server/{crypt,oracle,static,vault,wiki,zima}

rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/log/rclone-crypt.log" crypt: ~/server/crypt
rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/log/rclone-oracle.log" oracle: ~/server/oracle
rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/log/rclone-static.log" vault:apps/static ~/server/static
rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/log/rclone-vault.log" vault:files/vault ~/server/vault
rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/log/rclone-wiki.log" vault:apps/tiddlywiki/wiki ~/server/wiki
rclone mount --daemon --vfs-cache-mode full --log-file="$XDG_STATE_HOME/log/rclone-zima.log" zima:DATA ~/server/zima

