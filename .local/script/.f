#!/bin/bash

_git() {
	git --git-dir="$HOME/.config/dotfiles" --work-tree="$HOME" "$@"
}
conf() {
	cd "$HOME" || exit 1
	file=$(_git ls-files | fzf --preview "preview.sh {}")
	[[ -f $file ]] && $EDITOR "$file"
}
edit() {
	$EDITOR "$HOME/.gitignore"
}
fonts() {
	$EDITOR -O ~/.local/config/fonts.conf ~/.config/fontconfig/fonts.conf
}
zsh() {
	$EDITOR -o ~/.config/zsh/.zshenv ~/.config/zsh/.zprofile ~/.config/zsh/.zshrc
}

if [[ $# == 0 ]]; then
	_git status
elif [[ $(typeset -f "$1") ]]; then
	$1
else
	_git "$@"
fi


# config config --local status.showUntrackedFiles no
# https://www.atlassian.com/git/tutorials/dotfiles
