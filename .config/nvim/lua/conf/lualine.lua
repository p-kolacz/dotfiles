Plugin "https://github.com/nvim-lualine/lualine.nvim"

local separators = Icons.random_separators()

local function cwd()
	return vim.fn.getcwd()
end

local lualine = require "lualine"
lualine.setup {
	options = {
		-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md#available-themes
		theme = "auto",
		component_separators = separators.component_separators,
		section_separators = separators.section_separators,
		globalstatus = true,
	},

	tabline = {
		lualine_a = {"tabs"},
		lualine_z = {cwd},
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
	sections = {
		lualine_c = {},
		-- lualine_x = {'encoding', 'fileformat', 'filetype', require('lsp_spinner').status },
		lualine_x = {'encoding', 'fileformat', 'filetype' },
	},
}

autocmd("ColorScheme", {
	group = "vimrc",
	callback = function()
		lualine.setup {}
	end
})
