# Runs at login as second config file

source $ZDOTDIR/plugins/ssh-agent.zsh

path+="$HOME/.local/script"
path+="$HOME/.local/bin"
path+="$HOME/.local/lib/node_modules/bin"

export CALIBRE_USE_SYSTEM_THEME=1
export QT_QPA_PLATFORMTHEME="qt5ct"
# export DE=gnome		# xdg-open fix

CUSTOM="$HOME/.local/config/zsh/custom.zprofile"
[[ -f $CUSTOM ]] && source $CUSTOM

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	startx $XDG_CONFIG_HOME/xorg/xinitrc > $XDG_STATE_HOME/startx.log 2>&1
fi

