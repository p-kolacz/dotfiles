Plugin "https://github.com/folke/trouble.nvim"

mapgroup("<leader>x", "+Trouble")
nnoremap("<leader>xx", ":TroubleToggle<cr>", "toggle")
nnoremap("<leader>xw", ":TroubleToggle workspace_diagnostics<cr>", "workspace diagnostics")
nnoremap("<leader>xd", ":TroubleToggle document_diagnostics<cr>", "document diagnostics")
nnoremap("<leader>xq", ":TroubleToggle quickfix<cr>", "quickfix")
nnoremap("<leader>xl", ":TroubleToggle loclist<cr>", "loclist")
nnoremap("gr", " :TroubleToggle lsp_references<cr>", "LSP references")

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
}

