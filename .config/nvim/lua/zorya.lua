local M = {}

function M.colorscheme(name)
	vim.cmd("colorscheme "..name)
end

function M.auto_background(default)
	vim.o.background = vim.env.THEME_VARIANT and vim.env.THEME_VARIANT or (default or "dark")
end

function M.toggle_background()
	vim.o.background = vim.o.background == "light" and "dark" or "light"
end

function M.toggle_trailing_whitespaces()
-- vim.cmd[[highlight ExtraWhitespace ctermbg=red guibg=red]]
-- vim.cmd[[match ExtraWhitespace /\s\+$/]]
end

return M
