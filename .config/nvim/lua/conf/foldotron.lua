-- set.foldcolumn     = "auto"
set.foldlevelstart = 99
set.foldmethod     = "expr"
set.foldexpr       = "nvim_treesitter#foldexpr()"
set.foldtext       = "v:lua.Foldtext()"
-- https://vi.stackexchange.com/questions/25820/maintain-alignment-of-text-after-folding
function Foldtext()
	local fs = vim.api.nvim_get_vvar("foldstart")
	local line = vim.fn.trim(vim.fn.getline(fs))
	local indent = vim.fn.indent(fs)
	return string.rep(" ", indent) .. line .. "..."
end

