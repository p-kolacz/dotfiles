#!/bin/bash

case $(cat /etc/hostname) in
	hadron)
		"$XDG_CONFIG_HOME"/cinnamon/run.sh ;;
	serenity)
		"$XDG_CONFIG_HOME"/cinnamon/run.sh ;;
	workbook)
		"$XDG_CONFIG_HOME"/bspwm/run.sh ;;
	*)
esac

