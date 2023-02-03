nnoremap_buffer("<localleader>m", ":Emodel<cr>", "model")
nnoremap_buffer("<localleader>c", ":Econtroller<cr>", "controller")

Laser.start {
	name = "Solargraph",
	cmd = { "solargraph", "stdio" },
	settings = {
		solargraph = {
			diagnostics = true
		}
	},
}

