local M = {}

local function feed_keys(str)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), "n", false)
end

function M.capitalise_buffer()
end

function M.capitalise_line()
end

function M.move_line_down()
	vim.cmd("move .+1")
	vim.cmd("normal! ==")
end

function M.move_line_up()
	vim.cmd("move .-2")
	vim.cmd("normal! ==")
end

function M.move_selection_down()
end

function M.move_selection_up()
end

function M.remove_trailing_spaces()
end

function M.reverse_lines()
end

function M.substitute_cword()
end

function M.substitute_selected()
	vim.cmd('normal! "vy')
	local selection = vim.fn.getreg('"')
	feed_keys(":s/" .. selection .. "//g<left><left>")
end

return M
