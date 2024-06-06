#!/bin/bash

case "$(echo -e "󰒲  Suspend\n  Lock\n󰜉  Reboot\n󰐥  Poweroff" | rofi -dmenu -i -p "󰐥 " -theme-str 'window {width:15%;} listview {lines:4;}')" in
        "󰒲  Suspend") exec systemctl suspend;;
		"  Lock") exec lock-workstation ;;
        "󰜉  Reboot") exec systemctl reboot;;
        "󰐥  Poweroff") exec systemctl poweroff;;
		# Hibernate) exec systemctl hibernate;;
        # Logout) kill -HUP $XDG_SESSION_PID;;
esac

