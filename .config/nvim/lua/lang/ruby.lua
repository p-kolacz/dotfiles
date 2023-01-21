--  _____     _
-- | __  |_ _| |_ _ _
-- |    -| | | . | | |
-- |__|__|___|___|_  |
--               |___|


require'lspconfig'.solargraph.setup{
	filetypes = { "ruby", "eruby" },
	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH
}

