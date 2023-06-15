return {

	catppuccin = {
		URL = "https://github.com/catppuccin/nvim",
		flavors = { "latte", "frappe", "macchiato", "mocha" },
	},

	everforest_hard = {
		URL = "https://github.com/sainnhe/everforest",
		globals = {
			everforest_background = 'hard',
			everforest_enable_italic = 1,
			everforest_transparent_background = 2,
		},
	},

	everforest_medium = {
		URL = "https://github.com/sainnhe/everforest",
		globals = {
			everforest_background = 'medium',
			everforest_enable_italic = 1,
			everforest_transparent_background = 2,
		},
	},

	everforest_soft = {
		URL = "https://github.com/sainnhe/everforest",
		globals = {
			everforest_background = 'soft',
			everforest_enable_italic = 1,
			everforest_transparent_background = 2,
		},
	},

	gruvbox = {
		URL = "https://github.com/luisiacc/gruvbox-baby",
	},

	halcyon = {
		URL = "https://github.com/kwsp/halcyon-neovim",
	},

	nightfly = {
		URL = "https://github.com/bluz71/vim-nightfly-guicolors",
		globals = {
			nightflyTerminalColors = 0,			-- Use colorscheme in embeded teminal
			nightflyUnderlineMatchParen = 1,	-- Underline matching parens
			-- let.nightflyTransparent = 1,		-- Use transparent background
			-- nightflyCursorColor = 1,
		},
	},

	nightfox = {
		URL = "https://github.com/EdenEast/nightfox.nvim",
	},

	nord = {
		URL = 'https://github.com/arcticicestudio/nord-vim',
		-- https://www.nordtheme.com/docs/ports/vim/configuration
		globals = {
			nord_cursor_line_number_background = 1,
			nord_bold_vertical_split_line = 1,
			nord_italic = 1,
			nord_italic_comments = 1,
			nord_underline = 1,
		}
	},

	oceanic_next = {
		URL = 'https://github.com/mhartington/oceanic-next',
		globals = {
			oceanic_next_terminal_bold = 1,
			oceanic_next_terminal_italic = 1,
		},
	},

	onedark = {
		URL = "https://github.com/joshdick/onedark.vim",
	},

	papercolorslim = {
		URL = "https://github.com/pappasam/papercolor-theme-slim",
	},

	rosepine = {
		URL = "https://github.com/rose-pine/neovim",
		-- require"rose-pine".setup {
			-- 	dark_variant = "moon",
			-- 	disable_italics = true,
			-- }
	},

	solarized = {
		URL = "https://github.com/ishan9299/nvim-solarized-lua"
	},

	sonokai = {
		URL = "https://github.com/sainnhe/sonokai",
		globals = {
			sonokai_style = 'atlantis',
			sonokai_enable_italic = 1,
		},
	},

	tokyonight = {
		URL = "https://github.com/folke/tokyonight.nvim",
		globals = {
			tokyonight_style = 'storm',		-- available: night, storm, day
			tokyonight_transparent = 1,
		}
	},

}

