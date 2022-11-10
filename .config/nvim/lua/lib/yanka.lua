local M = {}

local function yank_expanded_expr(expr)
	local value = vim.fn.expand(expr)
	vim.fn.setreg("+",value)
	vim.fn.setreg("*",value)
	print(value .. " yanked to clipboard")
end

function M.filename()
	yank_expanded_expr("%:t")
end

function M.relative_path()
	yank_expanded_expr("%")
end

function M.full_path()
	yank_expanded_expr("%:p")
end

return M
