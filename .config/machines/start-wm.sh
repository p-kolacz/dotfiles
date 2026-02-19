#!/bin/bash

case $(cat /etc/hostname) in
	workbook)
		$XDG_CONFIG_HOME/bspwm/run.sh ;;
	*)
esac

