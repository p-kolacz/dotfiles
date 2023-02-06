setlocal.formatoptions:remove("o")

Mapper.map_buffer {
	"n", "<localleader>x",  ":call luaeval(getline('.'))<cr>",  "evaluate line in nvim",
	"n", "<localleader>s",  ":w<cr>:luafile %<cr>",             "evaluate file in nvim",
	"n", "<localleader>r",  ":w<cr>:!lua %<cr>",                "run file",
}

Helper.map {
	MANUAL     = "https://www.lua.org/pil/contents.html",
	API        = "https://www.lua.org/manual/5.1/#index",
	CHEATSHEET = "https://cheatography.com/srgmc/cheat-sheets/lua-scripting-5-1/",
	STYLEGUIDE = "https://github.com/luarocks/lua-style-guide",
}

Laser.start {
	name = "Sumneko",
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',  -- LuaJIT for Neovim
			},
			diagnostics = {
				globals = {'vim'},  -- Get the language server to recognize the `vim` global
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),  -- Make the server aware of Neovim runtime files
				checkThirdParty = false,							-- fix LSP startup messages
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

