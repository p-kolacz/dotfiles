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

function M.enable_highlight()
	vim.api.nvim_create_augroup("yanka", { clear = true })
	vim.api.nvim_create_autocmd("TextYankPost", { group = "yanka", pattern = "*", callback =
		function()
			vim.highlight.on_yank {higroup="IncSearch", timeout=500}
		end
	})
end

return M
