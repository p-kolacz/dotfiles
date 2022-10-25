Plugin {
	"https://github.com/tpope/vim-commentary",
	"https://github.com/tpope/vim-surround",
	"https://github.com/tpope/vim-repeat",
	"https://github.com/michaeljsmith/vim-indent-object",
}

nnoremap("<C-_>", ":Commentary<cr><down>") -- C-_ means C-/ and C-? means backspace but <BS> also works
nnoremap("<BS>",  ":Commentary<cr>")
vnoremap("<BS>",  ":Commentary<cr>")
nmap("<leader>cc", "yypkgccj", 'duplicomment')

