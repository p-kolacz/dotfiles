n() {
	export LC_COLLATE="C.UTF8" # put dotfiles first
	export NNN_OPTS=A
	export NNN_OPENER=open
	export NNN_TRASH=1 # trash-cli
	# nnn -n
	nnn
}


