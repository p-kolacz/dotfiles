#!/bin/bash

case $(cat /etc/hostname) in
	serenity)
		"$XDG_CONFIG_HOME"/cinnamon/run.sh ;;
	workbook)
		"$XDG_CONFIG_HOME"/bspwm/run.sh ;;
	*)
esac

