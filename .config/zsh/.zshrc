# Runs when starting interactive shell as third config file

# combine emacs & vim modes, must be before other bindkey calls
bindkey -e
bindkey '\e' vi-cmd-mode

for f in $ZDOTDIR/plugins/*.zsh; do source "$f"; done

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

[[ -f /opt/asdf-vm/asdf.sh ]] && . /opt/asdf-vm/asdf.sh

[[ -f $ZDOTDIR/local/.zshrc ]] && source $ZDOTDIR/local/.zshrc

eval "$(starship init zsh)"
