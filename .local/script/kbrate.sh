#!/bin/bash

exec >> /home/piotr/kbrate.log
exec 2>&1
date

# export DISPLAY=:0
# export XAUTHORITY=/run/user/1000/Xauthority
xset r rate 250 40

