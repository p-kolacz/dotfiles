# conf() {
# 	local old=$PWD
# 	cd ~/.dotfiles
# 	local file=$(find . -not -wholename "./.git*" -type f | fzf --preview "preview.sh {}")
# 	[[ -f $file ]] && $EDITOR "$file"
# 	cd "$old"
# }

encfile() {
	gpg --symmetric "$1"
}
decfile() {
	orig=${1%.gpg}
	[[ -f $orig ]] && { echo "$orig already exists"; return; }
	gpg --decrypt --output "$orig" "$1"
}

resmod() {
	find "$1" -type d -exec chmod 755 {} \;
	find "$1" -type f -exec chmod 644 {} \;
}

sheet () {
	curl cheat.sh/"$1"
}

edit_in_dir() {
	cd "$1" && $EDITOR "$2"
}

ealias() {
	local file=$ZDOTDIR/aliases.zsh
	$EDITOR $file
	source $file
}

efuncs() {
	local file=$ZDOTDIR/functions.zsh
	$EDITOR $file
	source $file
}

kk() {
	# local pid=$(ps -f -u $(whoami) | sed 1d | fzf --no-hscroll | awk '{print $2}')
	# [[ -n $pid ]] && kill -9 $pid
	local pid=$(ps --user $(whoami) --format pid,%cpu,comm --sort %cpu --no-headers \
		| fzf --preview 'ps -p {1} --format uid,pid,stime,tty,time,cmd' --preview-window=up,3,wrap | awk '{print $1}')
	[[ -n $pid ]] && kill -9 $pid
	# echo $pid
}

mkd() {
	mkdir -p "$1" && cd "$1"
}

n() {
	export LC_COLLATE="C"
	export NNN_TRASH=1		# trash-cli
	# nnn -n
	nnn
}

notes() {
	# local dir="$HOME/Cloud/Exocortex/Notes"
	# local file=$(find $dir -name "*.md" -type f | fzf --preview "preview.sh {}")
	# [[ -f $file ]] && edit_in_dir "$dir" "$file"
	cd "$HOME/Exocortex/Notes/"
	local file=$(find . -name "*.md" -type f | fzf --preview "preview.sh {}")
	[[ -f $file ]] && $EDITOR "$file"
}

rss2mp3() {
	curl $1 | egrep -o "https?://.*mp3" | uniq | xargs -P 10 -I _ curl -OL _
}

