setlocal.foldmethod = "indent"

require'lib/caniuse'.setup()
mapgroup("<leader>hu","Can I Use")
nnoremap_buffer('<leader>huc', ':CaniuseCword<cr>', 'caniuse cword')
nnoremap_buffer('<leader>huq', ':Caniuse ', 'caniuse query')

nnoremap("<localleader>l", ":!livereload -p 8000 &<cr>", "livereload server")

-- this should be set by cmp_nvim_lsp
-- local capabilities = LaSerPro.defaults.capabilities
-- capabilities.textDocument.completion.completionItem.snippetSupport = true


LaSerPro.start {
	name = "VSCode HTML LS",
	cmd = { "vscode-html-languageserver", "--stdio" },
	-- capabilities = capabilities,
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true
		},
		provideFormatter = true
	},
}

