local M = {
	listchars = {
		space = "⋅", tab = "|->", eol = "↲", nbsp = "+", trail = "•", extends = "⟩", precedes = "⟨",
	},
	fillchars = {
		fold = " ", foldopen = "", foldclose = "",
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
		separator = "➜",
		-- separator = "→",
		group = "+",
	},
	section_separators= { '',
		{ left = '', right = '' },
		{ left = '', right = '' },
		{ left = '', right = '' },
		-- { left = '  ', right = ' ' },
		{ left = '', right = '' },
		{ left = ' ', right = '' },
	},
	component_separators= { '',
		{ left = '', right = '' },
		{ left = '', right = '' },
		{ left = '', right = '' },
		-- { left = '  ', right = '  ' },
		{ left = '', right = '' },
		{ left = ' ', right = ' ' },
	},
}

function M.random_separators()
	math.randomseed(os.time())
	local random = math.random(#M.section_separators)
	return {
		section_separators = M.section_separators[random],
		component_separators = M.component_separators[random],
	}
end

-- Define icons highlights for diagnostics
function M.setup_diagnostics()
	for name, icon in pairs(M.diagnostics) do
		name = name:sub(1,1):upper()..name:sub(2)	-- capitalize name
		local hl = "DiagnosticSign" .. name
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

function M.setup_devicons()
	Plugin "https://github.com/kyazdani42/nvim-web-devicons"
	require "nvim-web-devicons".setup()
end

return M
