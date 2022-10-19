# Runs at login as second config file

source $ZDOTDIR/xdg-comply.zsh
source $ZDOTDIR/plugins/ssh-agent.zsh

path+="$HOME/.dotfiles/bin"
path+="$HOME/.local/bin"
path+="$HOME/.local/lib/node_modules/bin"
path+="$HOME/.local/share/gem/ruby/3.0.0/bin"

export CALIBRE_USE_SYSTEM_THEME=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export DE=gnome		# xdg-open fix

[[ -f $HOME/.local/config/zsh/custom.zprofile ]] && source $HOME/.local/config/zsh/custom.zprofile

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	startx $DOTFILES/xorg/xinitrc > $XDG_STATE_HOME/startx.log 2>&1
fi

