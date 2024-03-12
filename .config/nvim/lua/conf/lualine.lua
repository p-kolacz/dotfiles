Plugin "https://github.com/nvim-lualine/lualine.nvim"

local separators = Icons.random_separators()

local function cwd()
	return vim.fn.getcwd()
end

local function winbar()
	if NVIM_MODE == "standalone" then
		return {
			lualine_b = { {
				'filename',
				path = 1,
			}, },
		}
	end
end

local function tabline()
	if NVIM_MODE == "standalone" then
		return {
		lualine_a = {"tabs"},
		lualine_z = {cwd},
		}
	end
end

local function treesitter()
	return "TS:"..vim.treesitter.get_parser():lang()
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

	tabline = tabline(),
	winbar = winbar(),
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
		lualine_x = {treesitter, 'encoding', 'fileformat', 'filetype' },
	},
}

if NVIM_MODE == "firenvim" then
	Set {
		tabline = "",
		winbar = "",
	}
end

autocmd("ColorScheme", {
	group = "vimrc",
	callback = function()
		lualine.setup {}
	end
})
