setlocal.formatoptions:remove("t")

nnoremap_buffer("<localleader>s", ":!./%<CR>", "source file")
nnoremap_buffer("<localleader>x", ":.w !$SHELL<CR>", "execute line")

Helper.map {
	MANUAL     = "https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html",
	CHEATSHEET = "https://devhints.io/bash",
	CUSTOM1    = "https://devhints.io/bash#conditionals",
}

-- Laser.start {
-- 	name = "bashLS",
-- 	cmd = { "bash-language-server", "start" },
-- }
