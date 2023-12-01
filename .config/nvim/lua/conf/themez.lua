return {

	catppuccin = {
		url = "https://github.com/catppuccin/nvim",
		flavors = { "latte", "frappe", "macchiato", "mocha" },
		flavor = function(flavor)
			vim.cmd.colorscheme("catppuccin-"..flavor)
		end
	},

	everforest = {
		url = "https://github.com/sainnhe/everforest",
		setup = function()
			vim.g.everforest_enable_italic = 1
		end,
		flavors = { "hard", "medium", "soft" },
		flavor = function(flavor)
			vim.g.everforest_background = flavor
			vim.cmd.colorscheme("everforest")
		end,
		-- transparency = {
		-- 	global = "everforest_transparent_background",
		-- 	value = 2,
		-- },
	},

	gruvbox = {
		url = "https://github.com/luisiacc/gruvbox-baby",
		flavors = { "medium", "dark" },
		flavor = function(flavor)
			vim.g.gruvbox_baby_background_color = flavor
			vim.cmd.colorscheme("gruvbox-baby")
		end,
	},

	halcyon = {
		url = "https://github.com/kwsp/halcyon-neovim",
	},

	nightfly = {
		url = "https://github.com/bluz71/vim-nightfly-guicolors",
		setup = function()
			vim.g.nightflyTerminalColors = 0
			vim.g.nightflyUnderlineMatchParen = 1
		end,
		-- transparency = {
		-- 	global = "nightflyTransparent",
		-- },
	},

	nightfox = {
		url = "https://github.com/EdenEast/nightfox.nvim",
		flavors = { "carbonfox", "dayfox", "downfox", "duskfox", "nightfox", "nordfox", "terafox" },
		flavor = function(flavor)
			vim.cmd.colorscheme(flavor)
		end,
	},

	-- https://www.nordtheme.com/docs/ports/vim/configuration
	nord = {
		url = 'https://github.com/arcticicestudio/nord-vim',
		setup = function()
			vim.g.nord_cursor_line_number_background = 1
			vim.g.nord_bold_vertical_split_line = 1
			vim.g.nord_italic = 1
			vim.g.nord_italic_comments = 1
			vim.g.nord_underline = 1
		end,
	},

	oceanic_next = {
		url = 'https://github.com/mhartington/oceanic-next',
		setup = function()
			vim.g.oceanic_next_terminal_bold = 1
			vim.g.oceanic_next_terminal_italic = 1
		end,
		flavors = { "", "Light" },
		flavor = function(flavor)
			vim.cmd.colorscheme("OceanicNext"..flavor)
		end
	},

	onedark = {
		url = "https://github.com/joshdick/onedark.vim",
	},

	papercolorslim = {
		url = "https://github.com/pappasam/papercolor-theme-slim",
		flavors = { "dark", "light" },
		flavor = function(flavor)
			vim.o.background = flavor
			vim.cmd.colorscheme("PaperColorSlim")
		end,
	},

	["Rosé Pine"] = {
		url = "https://github.com/rose-pine/neovim",
		flavors = { "dawn", "main", "moon" },
		flavor = function(flavor)
			vim.cmd.colorscheme("rose-pine-"..flavor)
		end,
	},

	solarized = {
		url = "https://github.com/ishan9299/nvim-solarized-lua",
		flavors = { "normal", "low", "flat", "high" },
		flavor = function(flavor)
			local postfix = flavor == "normal" and "" or "-"..flavor
			vim.cmd.colorscheme("solarized"..postfix)
		end,
	},

	sonokai = {
		url = "https://github.com/sainnhe/sonokai",
		setup = function()
			vim.g.sonokai_enable_italic = 1
		end,
		flavors = { "atlantis", "andromeda", "default", "espresso", "maia", "shusia" },
		flavor = function(flavor)
			vim.g.sonokai_style = flavor
			vim.cmd.colorscheme("sonokai")
		end,
	},

	tokyonight = {
		url = "https://github.com/folke/tokyonight.nvim",
		flavors = { "day", "moon", "night", "storm" },
		flavor = function(flavor)
			vim.cmd.colorscheme("tokyonight-"..flavor)
		end,
		-- transparency = {
		-- 	global = "tokyonight_transparent",
		-- },
	},
}
