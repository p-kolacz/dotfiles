Icons = {
	diagnostics = {
		error = " ", warn = " ", hint = " ", info = " "
	},
	kinds = {
		Text = "", Method = "", Function = "", Constructor = "", Field = "ﰠ", Variable = "", Class = "ﴯ", Interface = "", Module = "", Property = "ﰠ", Unit = "塞", Value = "", Enum = "", Keyword = "", Snippet = "", Color = "", File = "", Reference = "", Folder = "", EnumMember = "", Constant = "", Struct = "פּ", Event = "", Operator = "", TypeParameter = "" },
	sources = {
		buffer = "﬘", nvim_lsp = "", ultisnips = "", emoji = "", calc = "", latex_symbols = "[LaTeX]", luasnip = "[LuaSnip]", nvim_lua = "[Lua]", },
}

-- Define icons highlights for diagnostics
for name, icon in pairs(Icons.diagnostics) do
	name = name:sub(1,1):upper()..name:sub(2)	-- capitalize name
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
