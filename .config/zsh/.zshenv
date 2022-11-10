# Runs always as first config file

export ZDOTDIR="$HOME/.config/zsh"
export TERMINAL="kitty"
export PAGER="less"
export EDITOR="nvim"
export BROWSER="brave"
export IMGVIEWER="nsxiv -a"
export IMGRIFLE="nsxiv-rifle"
export VMENU="rofi -dmenu"
export LG_CONFIG_FILE="$XDG_CONFIG_HOME/lazygit/config.yml,$XDG_CONFIG_HOME/lazygit/${THEME_VARIANT:-dark}.yml"
export FZF_DEFAULT_OPTS="--color=${THEME_VARIANT:-dark}"

source $ZDOTDIR/xdg-comply.zsh
source $($HOME/.local/script/theme current)

# alias xdg-open=open

[[ -f $ZDOTDIR/local/.zshenv ]] && source $ZDOTDIR/local/.zshenv

