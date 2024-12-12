vim.opt_local.formatoptions:remove("t")

nnoremap_buffer("<localleader>s", ":!./%<CR>", "source file")
nnoremap_buffer("<localleader>x", ":.w !$SHELL<CR>", "execute line")
nnoremap_buffer("<localleader>c", ":w !shellcheck %<CR>", "shellcheck")
vim.keymap.set("n", "<F5>", ":w<CR>:!$SHELL %<CR>", { buffer = 0 })

Helper.map {
	MANUAL     = "https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html",
	CHEATSHEET = "https://devhints.io/bash",
	CUSTOM1    = "https://devhints.io/bash#conditionals",
}

-- Laser.start {
-- 	name = "EFM",
-- 	cmd = { "efm-langserver" },
-- 	init_options = {documentFormatting = true},
-- 	filetypes = { "sh" },
--     settings = {
--       rootMarkers = {".git/"},
--     },
	-- init_options = {documentFormatting = true},
	-- settings = {
		-- rootMarkers = {".git/"},
		-- languages = {
		-- 	sh = {
		-- 		{
		-- 			lintCommand = "shellcheck --color=never --format gcc -x",
		-- 	-- 		-- lintCommand = "shellcheck --color=never --format=gcc -",
		-- 			lintSource = "efm/shellcheck",
		-- 			lintIgnoreExitCode = true,
		-- 			lintStdin = true,
		-- 			-- lintFormats = { '-:%l:%c: %trror: %m', '-:%l:%c: %tarning: %m', '-:%l:%c: %tote: %m' },
		-- 			lintFormats = {
		-- 				'%f:%l:%c: %trror: %m',
		-- 				'%f:%l:%c: %tarning: %m',
		-- 				'%f:%l:%c: %tote: %m',
		-- 			},
		-- 		},
		-- 	},
		-- },
	-- },
-- }

-- Laser.start {
-- 	name = "bashLS",
-- 	cmd = { "bash-language-server", "start" },
-- }
