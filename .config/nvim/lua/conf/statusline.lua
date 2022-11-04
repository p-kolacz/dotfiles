Plugin "https://github.com/nvim-lualine/lualine.nvim"

-- Plugin "https://github.com/WhoIsSethDaniel/lualine-lsp-progress.nvim"

local section_separators= { '',
	{ left = '', right = '' },
	{ left = '', right = '' },
	{ left = '', right = '' },
	{ left = '  ', right = ' ' },
	{ left = '', right = '' },
	{ left = ' ', right = ' ' },
}
local component_separators= { '',
	{ left = '', right = '' },
	{ left = '', right = '' },
	{ left = '', right = '' },
	{ left = '  ', right = '  ' },
	{ left = '', right = '' },
	{ left = ' ', right = ' ' },
}

math.randomseed(os.time())
local random = math.random(#section_separators)

require "lualine".setup {
	options = {
		theme = "auto",
		-- theme = "papercolor_light",
		-- theme = "solarized",
		-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md#available-themes
		component_separators = component_separators[random],
		section_separators = section_separators[random],
		globalstatus = true,
	},
	sections = {
		lualine_c = {},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
	},
	winbar = {
		lualine_b = { {
				'filename',
				path = 1,
			},
		},
	},
	inactive_winbar= {
		lualine_b = { {
				'filename',
				path = 1,
			},
		},
	},
	tabline = {
		lualine_z = {"tabs"},
	}
}

