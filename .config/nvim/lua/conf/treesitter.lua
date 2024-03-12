Plugin {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
}

mapgroup("<leader>ct",   "+Treesitter")

require"nvim-treesitter.configs".setup {
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	modules = {},
	ensure_installed = {
		"awk", "bash", "c", "c_sharp", "clojure", "cmake", "comment", "cpp", "css", "diff", "dockerfile", "dot",
		"gdscript", "git_rebase", "gitattributes", "gitcommit", "gitignore", "glsl", "go", "godot_resource", "gomod", "gowork",
		"hjson", "html", "http", "ini", "java", "javascript", "jq", "jsdoc", "json", "latex", "lua", "make",
		"markdown", "markdown_inline", "mermaid", "org", "perl", "php", "phpdoc", "python", "regex", "ruby", "rust", "scss",
		"sql", "todotxt", "toml", "typescript", "vhs", "vim", "vimdoc", "xml", "yaml",
	},
	highlight = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,	-- Automatically jump forward to textobj, similar to targets.vim
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
				[']f'] = '@function.outer',
			},
			goto_previous_start = {
				['[f'] = '@function.outer',
			},
		},
		swap = {
			enable = true,
			swap_next = {["<a-l>"] = "@parameter.inner"},
			swap_previous = {["<a-h>"] = "@parameter.inner"}
		},
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "vv", -- set to `false` to disable one of the mappings
			scope_incremental = "<cr>",
			node_incremental = "<tab>",
			node_decremental = "<s-tab>",
		},
	},
}

require"treesitter-context".setup()

Perun {
	{ "  TS: Enable highlight",  "TSBufEnable highlight"  },
	{ "  TS: Disable highlight", "TSBufDisable highlight" },
	{ "  TS: Context toggle",    "TSContextToggle"        },

}
