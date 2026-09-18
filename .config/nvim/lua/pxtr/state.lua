local M = {}

local group = vim.api.nvim_create_augroup("state", { clear = true })
vim.opt.viewoptions = "cursor,folds"

local function load_state(ev)
	if
		vim.bo[ev.buf].buftype ~= ""
		or vim.api.nvim_buf_get_name(ev.buf) == ""
		then return
	end

	vim.cmd("silent! loadview")
end

local function save_state(ev)
	local win = vim.fn.bufwinid(ev.buf)
	if
		vim.bo[ev.buf].buftype ~= ""
		or vim.api.nvim_buf_get_name(ev.buf) == ""
		or win == -1
		then return
	end

	vim.api.nvim_win_call(win, function() vim.cmd("mkview") end)
end

function M.enable()
	vim.api.nvim_create_autocmd("BufWinEnter", {
		group  = group,
		callback = load_state
	})
	vim.api.nvim_create_autocmd("BufWinLeave", {
		group = group,
		callback = save_state
	})
end
return M
