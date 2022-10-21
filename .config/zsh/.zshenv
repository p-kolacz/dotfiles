# Runs always as first config file

export ZDOTDIR="$HOME/.config/zsh"
export DOTFILES="$HOME/.dotfiles"
export TERMINAL="kitty"
export PAGER="less"
export EDITOR="nvim"
export BROWSER="brave"
export IMGVIEWER="nsxiv -a"
export IMGRIFLE="nsxiv-rifle"
export VMENU="rofi -dmenu"
export LG_CONFIG_FILE="$XDG_CONFIG_HOME/lazygit/config.yml,$XDG_CONFIG_HOME/lazygit/${THEME_VARIANT:-dark}.yml"

source $ZDOTDIR/xdg-comply.zsh

source $($DOTFILES/bin/theme current)

[[ -f $HOME/.local/config/zsh/custom.zshenv ]] && source $HOME/.local/config/zsh/custom.zshenv

