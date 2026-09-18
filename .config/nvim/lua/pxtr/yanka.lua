local M = {}

local function copy2clipboard(value)
	vim.fn.setreg("+",value)
	vim.fn.setreg("*",value)
end

local exprs = {
	filename      = "%:t",
	relative_path = "%:.",
	full_path     = "%:p",
	full_dir      = "%:p:h",
	cfile         = "<cfile>",
}

for fun,expr in pairs(exprs) do
	M[fun] = function()
		local value = vim.fn.expand(expr)
		copy2clipboard(value)
		print(value .. " yanked to clipboard")
	end
end

function M.buffer()
	vim.cmd("%y")
end

function M.buffer2clipboard()
	vim.cmd("%y *")
	vim.cmd("let @+=@*")
end

function M.paste_from_clipboard()
	vim.cmd [[ normal! "+P ]]
end

function M.visual2clipboard()
	vim.cmd [[
		normal! "*y
		let @+=@*
	]]
end

-- Send only real yanks (y, yy, Y, visual y, :y) to the system clipboard,
-- leaving d/x/c/s alone. Explicit registers ("ay) are skipped.
function M.enable_yank2clipboard()
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = vim.api.nvim_create_augroup("yanka", { clear = true }),
		pattern = "*",
		callback = function()
			local ev = vim.v.event
			if ev.operator ~= "y" or ev.regname ~= "" then return end
			vim.fn.setreg("+", ev.regcontents, ev.regtype)
			vim.fn.setreg("*", ev.regcontents, ev.regtype)
		end,
	})
end

function M.relative_path_with_line()
	local value = vim.fn.expand(exprs.relative_path) .. ':' .. vim.fn.line('.')
	copy2clipboard(value)
	print(value .. " yanked to clipboard")
end

return M
