--  _____     _
-- | __  |_ _| |_ _ _
-- |    -| | | . | | |
-- |__|__|___|___|_  |
--               |___|

Plugin {
	"https://github.com/vim-ruby/vim-ruby",
	"https://github.com/tpope/vim-rails",
	"https://github.com/tpope/vim-bundler",
	"https://github.com/tpope/vim-dispatch",
}

require'lspconfig'.solargraph.setup{
	filetypes = { "ruby", "eruby" },
	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH
}

