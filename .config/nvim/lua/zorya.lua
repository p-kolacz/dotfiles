local M = {}

local config = { colorschemes = {} }

function M.setup(user_config)
	config = user_config
end

function M.colorscheme(name)
	vim.cmd("colorscheme "..name)
end

function M.auto_background(default)
	vim.o.background = vim.env.THEME_VARIANT and vim.env.THEME_VARIANT or (default or "dark")
end

function M.toggle_background()
	vim.o.background = vim.o.background == "light" and "dark" or "light"
end

function M.list_colorschemes()
	-- for k,v in pairs(config.colorschemes) do
	-- end
end

 return M

