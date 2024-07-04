Plugin {
	{
		"https://github.com/rest-nvim/rest.nvim",
		config = function ()
			require("rest-nvim").setup {}
		end
	}
}

nnoremap_buffer("<localleader>x", "<Plug>RestNvim", "CURL current line")
nnoremap_buffer("<localleader>p", "<Plug>RestNvimPreview", "preview CURL of current line")
nnoremap_buffer("<localleader>r", "<Plug>RestNvimLast", "rerun last request")

setlocal.commentstring = "# %s"
