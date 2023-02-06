nnoremap_buffer("<localleader>m", ":Emodel<cr>", "model")
nnoremap_buffer("<localleader>v", ":Eview<cr>", "view")
nnoremap_buffer("<localleader>c", ":Econtroller<cr>", "controller")
nnoremap_buffer("<localleader>r", ":e config/routes.rb<cr>", "routes")

mapgroup("<localleader>s", "+Server")
nnoremap_buffer("<localleader>ss", ":Server<cr>", "start")
nnoremap_buffer("<localleader>sr", ":Rails restart<cr>", "restart")
nnoremap_buffer("<localleader>sc", ":Console<cr>")

Helper.map {
	API        = "https://api.rubyonrails.org/",
	CHEATSHEET = "https://dev.to/ericchapman/my-beloved-ruby-cheat-sheet-208o",
}

setlocal.foldcolumn='0'

Laser.start {
	name = "Solargraph",
	cmd = { "solargraph", "stdio" },
	init_options = {
		formatting = true
	},
	settings = {
		solargraph = {
			diagnostics = true
		}
	},
}

