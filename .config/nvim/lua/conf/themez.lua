return {

	catppuccin = {
		url = "https://github.com/catppuccin/nvim",
		flavors = { "latte", "frappe", "macchiato", "mocha" },
	},

	everforest = {
		url = "https://github.com/sainnhe/everforest",
		setup = {
			everforest_enable_italic = 1,
		},
		transparency = {
			global = "everforest_transparent_background",
			value = 2,
		},
		flavor_var = "everforest_background",
		flavors = { "hard", "medium", "soft" },
	},

	gruvbox = {
		url = "https://github.com/luisiacc/gruvbox-baby",
	},

	halcyon = {
		url = "https://github.com/kwsp/halcyon-neovim",
	},

	nightfly = {
		url = "https://github.com/bluz71/vim-nightfly-guicolors",
		setup = {
			nightflyTerminalColors = 0,
			nightflyUnderlineMatchParen = 1,
		},
		transparency = {
			global = "nightflyTransparent",
		},
	},

	nightfox = {
		url = "https://github.com/EdenEast/nightfox.nvim",
	},

	-- https://www.nordtheme.com/docs/ports/vim/configuration
	nord = {
		url = 'https://github.com/arcticicestudio/nord-vim',
		setup = {
			nord_cursor_line_number_background = 1,
			nord_bold_vertical_split_line = 1,
			nord_italic = 1,
			nord_italic_comments = 1,
			nord_underline = 1,
		}
	},

	oceanic_next = {
		url = 'https://github.com/mhartington/oceanic-next',
		setup = {
			oceanic_next_terminal_bold = 1,
			oceanic_next_terminal_italic = 1,
		},
	},

	onedark = {
		url = "https://github.com/joshdick/onedark.vim",
	},

	papercolorslim = {
		url = "https://github.com/pappasam/papercolor-theme-slim",
	},

	["rose-pine"] = {
		url = "https://github.com/rose-pine/neovim",
		flavors = { "dawn", "main", "moon" },
	},

	solarized = {
		url = "https://github.com/ishan9299/nvim-solarized-lua",
		flavors = { "low", "flat", "high" },
	},

	sonokai = {
		url = "https://github.com/sainnhe/sonokai",
		setup = {
			sonokai_enable_italic = 1,
		},
		flavor_var = "sonokai_style",
		flavors = {
			"default", "atlantis", "andromeda", "shusia", "maia", "espresso"
		},
	},

	tokyonight = {
		url = "https://github.com/folke/tokyonight.nvim",
		transparency = {
			global = "tokyonight_transparent",
		},
		flavors = { "storm", "night", "moon", "day" },
	},

}

