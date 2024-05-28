n() {
	export LC_COLLATE="C.UTF8" # put dotfiles first
	export NNN_OPTS=ARU # A - disable dir auto enter on search, R - disable rollover, U - show user and group in status bar
	export NNN_OPENER=open
	export NNN_TRASH=1 # trash-cli
	# nnn -n
	nnn
}


