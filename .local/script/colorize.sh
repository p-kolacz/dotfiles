#!/bin/bash

format() {
	declare -A codes=([reset]=0 [bold]=1 [italic]=3 [underline]=4 [undercurl]=4:3 [reverse]=7 [strike]=9 [black]=30 [red]=31 [green]=32 [yellow]=33 [blue]=34 [magenta]=35 [cyan]=36 [white]=37 [default]=39)
	for x in $@; do
		local code
		if [ ${x:0:4} == bgbr ]; then
			code=${codes[${x:4}]} && ((code=code+70))
		elif [ ${x:0:2} == bg ]; then
			code=${codes[${x:2}]} && ((code=code+10))
		elif [ ${x:0:2} == br ]; then
			code=${codes[${x:2}]} && ((code=code+60))
		else
			local code=${codes[$x]}
		fi
		printf "\e[%sm" $code
	done
}

colorize() {
	[ $# -eq 2 ] &&
		sed "s/$1/$(format $2)&$(format reset)/" || 
		echo "Usage: COMMAND | colorize REGEX COLOR"
}

# format $@
# colorize $@

