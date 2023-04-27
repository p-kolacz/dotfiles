augroup("vimrc", { clear = true })

autocmd("FocusLost", {
	group = "vimrc",
	pattern = "*",
	command = "wall",
})
autocmd("BufWinEnter", {
	group = "vimrc",
	pattern = { "*/.config/nvim/init.lua", "*/.config/nvim/lua/conf/appearance.lua" },
	command = "setlocal includeexpr=stdpath('config').'/lua/'.v:fname"
})

-- Remeber foldings and stuff...
set.viewoptions = "cursor,folds"
autocmd("BufWinLeave", {
	group = "vimrc",
	pattern = "?*",			-- ?* ensures filename is not empty, for non-file buffers
	command = "mkview",
})
autocmd("BufWinEnter", {
	group = "vimrc",
	pattern = "?*",
	command = "silent! loadview",
})


vim.cmd("command! -nargs=1 Rsync :!rsync -avz --filter=':- .gitignore' ./ <args>")
