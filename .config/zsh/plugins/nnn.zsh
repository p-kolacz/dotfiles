n() {
	export LC_COLLATE="C.UTF8" # put dotfiles first
	export NNN_OPTS=A
	export NNN_OPENER=open
	export NNN_TRASH=1 # trash-cli
	export NNN_PLUG='y:! echo -n "$nnn" | xclip -selection clipboard'
	# nnn -n
	nnn
}


