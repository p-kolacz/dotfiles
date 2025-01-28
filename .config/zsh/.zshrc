# Runs when starting interactive shell as third config file

# combine emacs & vim modes, must be before other bindkey calls
bindkey -e
bindkey '\e' vi-cmd-mode

# completion
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

# load plugins
for f in $ZDOTDIR/plugins/*.zsh; do source "$f"; done

# load local rc
[[ -f $ZDOTDIR/local/.zshrc ]] && source $ZDOTDIR/local/.zshrc

# setup prompt
eval "$(starship init zsh)"
