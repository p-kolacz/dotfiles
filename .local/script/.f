#!/bin/bash

export GIT_DIR="$HOME/.config/dotfiles"
export GIT_WORK_TREE="$HOME"

conf() {
	cd || exit
	file=$(git ls-files | fzf --query "$1" --preview "bat --color=always --plain {}")
	[[ -f $file ]] && $EDITOR "$file"
}
diff() {
	cd || exit
	g diff
	git status
}
install() {
	[[ -e $GIT_DIR ]] && { echo "$GIT_DIR already exists"; exit 1; }
	mkdir -p "$GIT_DIR"
	cd &&
	git clone --bare git@github.com:p-kolacz/dotfiles.git "$GIT_DIR" &&
	git checkout
}
puda() {
	cd "$HOME" || exit 1
	git add .
	git commit -m "$(date +%F_%T)"
	git push
}
pull() {
	git pull
}
zsh() {
	$EDITOR -o ~/.config/zsh/.zshenv ~/.config/zsh/.zprofile ~/.config/zsh/.zshrc
}

if [[ $# == 0 ]]; then
	cd && git status
elif [[ $(typeset -f "$1") ]]; then
	func=$1 && shift
	$func "$@"
else
	"$@"
fi

# vim:ft=bash
