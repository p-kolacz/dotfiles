-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
Plugin "https://github.com/neovim/nvim-lspconfig"

vim.o.updatetime = 250

mapgroup("<leader>D", "+Diagnostics")
-- nnoremap('<leader>Df', '<cmd>lua vim.diagnostic.open_float()<CR>', "open float")
nnoremap('<leader>Dl', vim.diagnostic.setloclist, "set loclist")
-- nnoremap('<leader>Dh', vim.diagnostic.hide, "hide")
-- nnoremap('<leader>Ds', vim.diagnostic.show, "show")
nnoremap('[d',         vim.diagnostic.goto_prev, "prev diagnostic")
nnoremap(']d',         vim.diagnostic.goto_next, "next diagnostic")

mapgroup("<leader>l", "+LSP")
-- nnoremap('<leader>li', ':LspInfo<cr>', 'info')
nnoremap('<leader>li', Laser.print_name, 'info')
-- nnoremap('<leader>ls', LaSerPro.stop, 'stop')
-- nnoremap('<leader>lS', ':LspStop<cr>', 'stop')
-- nnoremap('<leader>lr', LaSerPro.restart, 'restart')
nnoremap("<leader>ll", ":tabnew<cr>:e "..vim.lsp.get_log_path().."<cr>", "logs")

-- local lsp_spinner = require('lsp_spinner')

Laser.defaults.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	nnoremap_buffer('gd', vim.lsp.buf.definition, "goto definition")
	nnoremap_buffer('gD', vim.lsp.buf.declaration, "goto declaration")
	nnoremap_buffer('gi', vim.lsp.buf.implementation, "goto implementation")
	nnoremap_buffer('gr', vim.lsp.buf.references, "goto references")
	nnoremap_buffer('K', vim.lsp.buf.hover, "LSP hover")
	nnoremap_buffer('<leader>ch', vim.lsp.buf.signature_help, 'signature')
	nnoremap_buffer('<leader>cd', vim.lsp.buf.type_definition, 'type definition')
	nnoremap_buffer('<leader>cr', vim.lsp.buf.rename, 'rename')
	nnoremap_buffer('<leader>ca', vim.lsp.buf.code_action, 'code actions')

	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end
	})
	-- lsp_spinner.on_attach(client, bufnr)
end

Cmdr.add {
	-- LSP --------------------------------------------------------------------
	{ " Stop language server",        Laser.stop },
	{ " Language servers logs",       Laser.logs },
}

Plugin "https://github.com/j-hui/fidget.nvim"
require"fidget".setup{}

Plugin "https://github.com/ray-x/lsp_signature.nvim"
require "lsp_signature".setup()

