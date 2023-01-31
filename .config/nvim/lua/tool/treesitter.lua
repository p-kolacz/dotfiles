Plugin {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
}

mapgroup("<leader>ct",   "+Treesitter")
-- mapgroup("<leader>cth",  "+Highlight")
-- nnoremap("<leader>cthe", ":TSBufEnable highlight<cr>", "enable buffer highlight")
-- nnoremap("<leader>cthd", ":TSBufDisable highlight<cr>", "disable buffer highlight")
-- nnoremap("<leader>ctht", ":TSBufToggle highlight<cr>", "toggle buffer highlight")

require"nvim-treesitter.configs".setup {
	-- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"awk", "bash", "c", "c_sharp", "clojure", "cmake", "comment", "cpp", "css", "diff", "dockerfile", "dot",
		"gdscript", "git_rebase", "gitattributes", "gitcommit", "gitignore", "glsl", "go", "godot_resource", "gomod", "gowork",
		"help", "hjson", "html", "http", "ini", "java", "javascript", "jq", "jsdoc", "json", "latex", "lua", "make",
		"markdown", "markdown_inline", "mermaid", "org", "perl", "php", "phpdoc", "python", "regex", "ruby", "rust", "scss",
		"sql", "toml", "typescript", "vhs", "vim", "yaml",
	},

	-- ignore_install = { "phpdoc" },

	highlight = { enable = true },

	textobjects = {
		select = {
			enable = true,
			lookahead = true,		-- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ao"] = "@block.outer",
				["io"] = "@block.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			}
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']]'] = '@function.outer',
			},
			goto_previous_start = {
				['[['] = '@function.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {["<a-l>"] = "@parameter.inner"},
			swap_previous = {["<a-h>"] = "@parameter.inner"}
		}
	}
}

require"treesitter-context".setup()

