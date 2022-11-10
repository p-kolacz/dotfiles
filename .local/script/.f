#!/bin/bash

_git() {
	git --git-dir="$HOME/.config/dotfiles" --work-tree="$HOME" "$@"
}
conf() {
	cd "$HOME" || exit 1
	file=$(_git ls-files | fzf --query "$1" --preview "view {}")
	[[ -f $file ]] && $EDITOR "$file"
}
edit() {
	$EDITOR "$HOME/.gitignore"
}
fonts() {
	$EDITOR -O ~/.config/fontconfig/conf.d/99-local.conf ~/.config/fontconfig/fonts.conf
}
puda() {
	cd "$HOME" || exit 1
	_git add .
	_git commit -m "$(date +%F_%T)"
	_git push
}
zsh() {
	$EDITOR -o ~/.config/zsh/.zshenv ~/.config/zsh/.zprofile ~/.config/zsh/.zshrc
}

if [[ $# == 0 ]]; then
	cd && _git status
elif [[ $(typeset -f "$1") ]]; then
	func=$1 && shift
	$func "$@"
else
	_git "$@"
fi

# https://www.atlassian.com/git/tutorials/dotfiles
