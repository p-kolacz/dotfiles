local M = {}

local exprs = {
	filename = "%:t",
	relative_path = "%",
	full_path = "%:p",
	full_dir = "%:p:h",
	cfile = "<cfile>",
}

for fun,expr in pairs(exprs) do
	M[fun] = function()
		local value = vim.fn.expand(expr)
		vim.fn.setreg("+",value)
		vim.fn.setreg("*",value)
		print(value .. " yanked to clipboard")
	end
end

function M.buffer()
	vim.cmd("%y *")
	vim.cmd("let @+=@*")
end

function M.set_clipboard()
	vim.opt.clipboard = "unnamed,unnamedplus"
	print(vim.cmd("set clipboard?"))
end

function M.unset_clipboard()
	vim.opt.clipboard = nil
	print(vim.cmd("set clipboard?"))
end

return M
