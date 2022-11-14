#!/bin/bash

export GIT_DIR="$HOME/.config/dotfiles"
export GIT_WORK_TREE="$HOME"

# git() {
# 	/usr/bin/git --git-dir="$HOME/.config/dotfiles" --work-tree="$HOME" "$@"
# }
# export -f git

# alias git="git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME"

conf() {
	cd "$HOME" || exit 1
	file=$(git ls-files | fzf --query "$1" --preview "view {}")
	[[ -f $file ]] && $EDITOR "$file"
}
diff() {
	cd "$HOME" || exit 1
	g diff
}
edit() {
	$EDITOR "$HOME/.gitignore"
}
# fonts() {
# 	$EDITOR -O ~/.config/fontconfig/conf.d/99-local.conf ~/.config/fontconfig/fonts.conf
# }
puda() {
	cd "$HOME" || exit 1
	git add .
	git commit -m "$(date +%F_%T)"
	git push
}
zsh() {
	$EDITOR -o ~/.config/zsh/.zshenv ~/.config/zsh/.zprofile ~/.config/zsh/.zshrc
}

if [[ $# == 0 ]]; then
	cd && diff
elif [[ $(typeset -f "$1") ]]; then
	func=$1 && shift
	$func "$@"
else
	"$@"
fi

