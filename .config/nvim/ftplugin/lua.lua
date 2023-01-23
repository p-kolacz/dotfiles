setlocal.formatoptions:remove("o")

nnoremap_buffer("<localleader>x", ":call luaeval(getline('.'))<cr>", "evaluate line in nvim")
nnoremap_buffer("<localleader>s", ":w<cr>:luafile %<cr>", "evaluate file in nvim")
nnoremap_buffer("<localleader>r", ":w<cr>:!lua %<cr>", "run file")

Help.map(Help.Type.MANUAL,     "https://www.lua.org/manual/5.1/")
Help.map(Help.Type.API,        "https://www.lua.org/manual/5.1/#index")
Help.map(Help.Type.CHEATSHEET, "https://cheatography.com/srgmc/cheat-sheets/lua-scripting-5-1/")
Help.map(Help.Type.STYLEGUIDE, "https://github.com/luarocks/lua-style-guide")

-- package.loaded["lib/lua-live-tests"] = nil
require"lib/lua-live-tests"

LaSerPro.start {
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
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	-- capabilities = LSP_CAPABILITIES,
	-- on_attach = LSP_ON_ATTACH,
}

