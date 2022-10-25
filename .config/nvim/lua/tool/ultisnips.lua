Plugin {
	"https://github.com/adriaanzon/vim-emmet-ultisnips",
	"https://github.com/SirVer/ultisnips",
}

mapgroup("<leader>u", "+Snippets")
nnoremap("<leader>uf", ":UltiSnipsEdit<CR>", "edit filetype snippets")
nnoremap("<leader>ua", ":UltiSnipsEdit!all<CR>", "edit all snippets")

let.UltiSnipsExpandTrigger       = '<tab>'
let.UltiSnipsJumpForwardTrigger  = '<tab>'
let.UltiSnipsJumpBackwardTrigger = '<s-tab>'

