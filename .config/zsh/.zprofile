# Runs at login as second config file

source $ZDOTDIR/autorun/ssh-agent.zsh

path+="$HOME/.local/bin"
path+="$HOME/.local/script"

LOCAL_PROFILE=$ZDOTDIR/local/.zprofile
[[ -f $LOCAL_PROFILE ]] && source $LOCAL_PROFILE

MACHINE_PROFILE=$ZDOTDIR/machines/$(cat /etc/hostname).zprofile
[[ -f $MACHINE_PROFILE ]] && source $MACHINE_PROFILE

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	$XDG_CONFIG_HOME/start-wm.sh
fi
