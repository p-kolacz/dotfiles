-- Run :TSUpdate after install
Plugin {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
}

mapgroup("<leader>ct", "+Treesitter")
mapgroup("<leader>cth", "+Highlight")
nnoremap("<leader>cthe", ":TSBufEnable highlight<cr>", "enable buffer highlight")
nnoremap("<leader>cthd", ":TSBufDisable highlight<cr>", "disable buffer highlight")
nnoremap("<leader>ctht", ":TSBufToggle highlight<cr>", "toggle buffer highlight")

require"nvim-treesitter.configs".setup {

	ensure_installed = "all" , -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = { "phpdoc" },

	highlight = { enable = true },

	textobjects = {
		select = {
			enable = true,
			lookahead = true,		-- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner"
			}
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']]'] = '@function.outer',
				-- [']]'] = '@class.outer'
			},
			-- goto_next_end = {
			-- 	[']M'] = '@function.outer',
			-- 	[']['] = '@class.outer'
			-- },
			goto_previous_start = {
				['[['] = '@function.outer',
				-- ['[['] = '@class.outer'
			},
			-- goto_previous_end = {
			-- 	['[M'] = '@function.outer',
			-- 	['[]'] = '@class.outer'
			-- }
		},
		swap = {
			enable = true,
			swap_next = {["<a-l>"] = "@parameter.inner"},
			swap_previous = {["<a-h>"] = "@parameter.inner"}
		}
	}
}

