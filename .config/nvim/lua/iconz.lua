local M = {
	listchars = {
		space = "⋅", tab = "|->", eol = "↲", nbsp = "+", trail = "•", extends = "⟩", precedes = "⟨",
	},
	fillchars = {
		-- fold = " ", foldopen = "", foldclose = "",
		foldopen = "", foldclose = "",
		horiz = "═", horizdown = "╦", horizup = "╩",
		vert = "║", vertright = "╠", verthoriz = "╬", vertleft = "╣",
	},
	diagnostics = {
		error = " ", warn = " ", hint = " ", info = " "
	},
	kinds = {
		Text = "", Method = "", Function = "", Constructor = "", Field = "ﰠ", Variable = "", Class = "ﴯ", Interface = "", Module = "", Property = "ﰠ", Unit = "塞", Value = "", Enum = "", Keyword = "", Snippet = "", Color = "", File = "", Reference = "", Folder = "", EnumMember = "", Constant = "", Struct = "פּ", Event = "", Operator = "", TypeParameter = ""
	},
	sources = {
		buffer = "﬘", nvim_lsp = "", ultisnips = "", emoji = "", calc = "", latex_symbols = "[LaTeX]", luasnip = "[LuaSnip]", nvim_lua = "[Lua]",
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
		{ left = '  ', right = '|' },
		{ left = '', right = '' },
		{ left = ' ', right = '|' },
	},
	component_separators= { '',
		{ left = '', right = '' },
		{ left = '', right = '' },
		{ left = '', right = '' },
		{ left = '  ', right = '|' },
		{ left = '', right = '' },
		{ left = ' ', right = '|' },
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
