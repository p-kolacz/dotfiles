# Runs when starting interactive shell as third config file

# combine emacs & vim modes, must be before other bindkey calls
bindkey -e
bindkey '\e' vi-cmd-mode

source $ZDOTDIR/plugins/abbr.zsh
source $ZDOTDIR/plugins/less.zsh
source $ZDOTDIR/plugins/tldr.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/aliases.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
[[ -f $HOME/.local/config/zsh/custom.zshrc ]] && source $HOME/.local/config/zsh/custom.zshrc

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

unalias run-help
autoload run-help
alias help=run-help

HISTFILE="$XDG_STATE_HOME/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt autocd

# [[ -d $DOTFILES/bin/diyfetch ]] && $(find .dotfiles/bin/diyfetch/* | shuf -n1)
[[ -d $DOTFILES/bin/diyfetch ]] && ("$DOTFILES/bin/diyfetch/timefetch")


eval "$(starship init zsh)"

