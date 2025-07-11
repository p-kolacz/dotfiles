local M = {
	listchars = {
		space = "⋅", tab = "|->", eol = "↲", nbsp = "+", trail = "•", extends = "⟩", precedes = "⟨",
	},
	fillchars = {
		foldopen = "", foldclose = "",
		horiz = "═", horizdown = "╦", horizup = "╩",
		vert = "║", vertright = "╠", verthoriz = "╬", vertleft = "╣",
	},
	diagnostics = {
		error = " ", warn = " ", hint = " ", info = " "
	},
	kinds = {
		Class         = " ", Color         = " ", Constant      = " ", Constructor   = " ", Enum          = " ",
		EnumMember    = " ", File          = " ", Folder        = " ", Function      = "󰊕 ", Event         = " ",
		Field         = "󰠴 ", Interface     = " ", Keyword       = " ", Method        = " ", Module        = " ",
		Operator      = " ", Property      = " ", Reference     = " ", Snippet       = " ", Struct        = " ",
		Text          = " ", TypeParameter = " ", Unit          = "U ", Value         = "V ", Variable      = "󰫧 ",
	},
	sources = {
		buffer = " ", nvim_lsp = " ", ultisnips = " ", emoji = " ", calc = " ", latex_symbols = " ", nvim_lua = "󰢱 ",
	},
	whichkey = {
		breadcrumb = "»",
		separator = "→",
		group = "+",
	},
	section_separators= { '',
		{ left = '', right = '' },
		{ left = '', right = '' },
		{ left = '', right = '' },
		{ left = '', right = '' },
		-- { left = '  ', right = '|' },
		-- { left = ' ', right = '|' },
	},
	component_separators= { '',
		{ left = '', right = '' },
		{ left = '', right = '' },
		{ left = '', right = '' },
		{ left = '', right = '' },
		-- { left = '  ', right = '|' },
		-- { left = ' ', right = '|' },
	},

	random_separators = function(self)
		math.randomseed(os.time())
		local random = math.random(#self.section_separators)
		return {
			section_separators = self.section_separators[random],
			component_separators = self.component_separators[random],
		}
	end

}
return M
