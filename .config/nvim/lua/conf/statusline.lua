Plugin "https://github.com/nvim-lualine/lualine.nvim"
-- Plugin "https://github.com/doums/lsp_spinner.nvim"

local separators = Icons:random_separators()

require "lualine".setup {
	options = {
		-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md#available-themes
		theme = "auto",
		component_separators = separators.component_separators,
		section_separators = separators.section_separators,
		globalstatus = true,
	},
	sections = {
		lualine_c = {},
		-- lualine_x = {'encoding', 'fileformat', 'filetype', require('lsp_spinner').status },
		lualine_x = {'encoding', 'fileformat', 'filetype' },
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

