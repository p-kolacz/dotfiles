setlocal.formatoptions:remove("t")

nnoremap_buffer("<localleader>s", ":!./%<CR>", "source file")
nnoremap_buffer("<localleader>x", ":.w !$SHELL<CR>", "execute line")

Help.map(Help.Type.MANUAL, "https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html")
Help.map(Help.Type.CHEATSHEET, "https://devhints.io/bash")
Help.map(Help.Type.CUSTOM1, "https://devhints.io/bash#conditionals")

