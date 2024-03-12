-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

Plugin "--branch legacy https://github.com/j-hui/fidget.nvim"
require "fidget".setup{}

Plugin "https://github.com/ray-x/lsp_signature.nvim"
require "lsp_signature".setup()

vim.o.updatetime = 250

mapgroup("<leader>l", "+LSP")
Noremap {
	{ "n", "<leader>li", Laser.print_name, "info" },
	{ "n", "<leader>ls", Laser.stop,       "stop" },
	{ "n", "<leader>ll", Laser.logs,       "logs" },
}

Perun {
	{ "  LSP: Stop", Laser.stop },
	{ "  LSP: Logs", Laser.logs },
}

autocmd('LspAttach', {
	group = augroup('UserLspConfig', {}),
	callback = function(args)
		vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc' -- Enable completion triggered by <c-x><c-o>

		BufferNoremap {
			{ "n", "gd", vim.lsp.buf.definition, "goto definition" },
			{ "n", "gD", vim.lsp.buf.declaration, "goto declaration" },
			{ "n", "gi", vim.lsp.buf.implementation, "goto implementation" },
			{ "n", "gr", vim.lsp.buf.references, "goto references" },
			{ "n", "K",  vim.lsp.buf.hover, "LSP hover" },
			{ "n", "<leader>cs", vim.lsp.buf.signature_help, "signature" },
			{ "n", "<leader>ct", vim.lsp.buf.type_definition, "type definition" },
			{ "n", "<leader>cr", vim.lsp.buf.rename, "rename" },
			{ "n", "<leader>ca", vim.lsp.buf.code_action, "code actions" },
			{ "n", "<leader>cf", vim.lsp.buf.format, "format buffer" },
		}

		vim.api.nvim_create_autocmd("CursorHold", {
			buffer = args.buf,
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
	end
})

