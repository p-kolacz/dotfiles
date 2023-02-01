local M = {}

function M.auto_background(default)
	default = default or "dark"
	vim.o.background = vim.env.THEME_VARIANT and vim.env.THEME_VARIANT or default
end

function M.toggle_background()
	vim.o.background = vim.o.background == "light" and "dark" or "light"
end

function M.toggle_trailing_whitespaces()
-- vim.cmd[[highlight ExtraWhitespace ctermbg=red guibg=red]]
-- vim.cmd[[match ExtraWhitespace /\s\+$/]]
end

return M
