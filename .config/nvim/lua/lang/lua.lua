let.vimsyn_embed= 'l'		-- Enable embeded lua syntax highlighting

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',  -- LuaJIT for Neovim
				-- path = runtime_path,
			},
			diagnostics = {
				globals = {'vim'},  -- Get the language server to recognize the `vim` global
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),  -- Make the server aware of Neovim runtime files
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH,
}

