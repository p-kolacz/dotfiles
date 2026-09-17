-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

Plugin {
	"--branch legacy https://github.com/j-hui/fidget.nvim",
	"https://github.com/ray-x/lsp_signature.nvim",
}
require "fidget".setup{}
require "lsp_signature".setup()


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

vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
	group = vim.api.nvim_create_augroup("DiagFloat", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = true,
			prefix = " ",
			scope = "cursor",
		})
	end,
})

