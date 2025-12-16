# Runs at login as second config file

source $ZDOTDIR/autorun/ssh-agent.zsh

path+="$HOME/.local/bin"
path+="$HOME/.local/script"

export CALIBRE_USE_SYSTEM_THEME=1
export QT_QPA_PLATFORMTHEME=qt6ct

[[ -f $ZDOTDIR/local/.zprofile ]] && source $ZDOTDIR/local/.zprofile

MACHINE_PROFILE=$ZDOTDIR/machines/$(cat /etc/hostname).zprofile
[[ -f $MACHINE_PROFILE ]] && source $MACHINE_PROFILE

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	startx $XDG_CONFIG_HOME/xorg/.xinitrc > $XDG_STATE_HOME/log/startx.log 2>&1
fi

