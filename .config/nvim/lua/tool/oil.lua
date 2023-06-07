Plugin "https://github.com/stevearc/oil.nvim"

require"oil".setup {
	float = {
		padding = 5,	-- Padding around the floating window
		max_width = 80,
		max_height = 20,
		border = "single",
		win_options = {
			winblend = 0,
		},
	},
	keymaps = {
		["q"] = "actions.close",
		["<ESC>"] = "actions.close",
		["~"] = "actions.open_cwd",
		["gh"] = "actions.open_cwd",
		["<BS>"] = "actions.parent",
		["gp"] = "actions.preview",
	},
}

nnoremap("<leader>fo", ":Oil --float<CR>", "Oil (float)")

Cmdr.add {
	{ "  Open Oil", "Oil" },
	{ "  Float Oil", "Oil --float" },
}

