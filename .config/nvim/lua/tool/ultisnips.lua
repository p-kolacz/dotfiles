Plugin {
	"https://github.com/adriaanzon/vim-emmet-ultisnips",
	"https://github.com/SirVer/ultisnips",
}

global {
	UltiSnipsExpandTrigger       = '<tab>',
	UltiSnipsJumpForwardTrigger  = '<tab>',
	UltiSnipsJumpBackwardTrigger = '<s-tab>',
}

mapgroup("<leader>u", "+Snippets")
nnoremap("<leader>uf", ":UltiSnipsEdit<CR>", "edit filetype snippets")
nnoremap("<leader>ua", ":UltiSnipsEdit!all<CR>", "edit all snippets")

Cmdr.add {
	{ "Edit filetype snippets",      "UltiSnipsEdit" },
	{ "Edit all snippets",           "UltiSnipsEdit!all" },
}
