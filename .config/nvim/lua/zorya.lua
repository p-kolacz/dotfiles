package.loaded["zorya"] = nil

local M = {}
local config -- = { colorschemes = {} }

if not vim.g.ZORYA then
	vim.g.ZORYA = { colorscheme = nil, flavor = nil, transparency = false }
end

local function current_scheme_config()
	return config.colorschemes[vim.g.ZORYA.colorscheme]
end

function M.setup(user_config)
	config = user_config
	-- for key, value in pairs(user_config) do
	-- 	config[key] = value
	-- end
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

function M.toggle_transparency()
	local current_config = current_scheme_config()
	if current_config and current_config.transparency then
		local transparency_global = current_config.transparency.global
		local current_value = vim.g[transparency_global]
		vim.g[transparency_global] =
			(current_value == nil or current_value == 0)
			and (current_config.transparency.value or 1)
			or 0
	else
		vim.notify("Scheme ".." doesn't support transparency", vim.log.levels.INFO)
	end
end

function M.list_colorschemes()
	local schemes = {}
	for name,conf in pairs(config.colorschemes) do
		if conf.flavors then
			for _,flavor in ipairs(conf.flavors) do
				table.insert(schemes, { name, flavor })
			end
		else
			table.insert(schemes, { name })
		end
	end
	return schemes
end

function M.select_colorscheme()
	vim.ui.select(
		M.list_colorschemes(),
		{
			prompt = "Select colorscheme",
			format_item = function(item)
				return item[1]..(item[2] and " "..item[2] or "")
			end,
		},
		function(choice)
			return choice and M.set_colorscheme(choice[1], choice[2])
		end
	)
end

function M.set_colorscheme(scheme, flavor, transparency)
	-- TODO: check for valid scheme name and flavor
	local scheme_config = config.colorschemes[scheme]
	Plugin(scheme_config.url)
	if scheme_config.setup then
		for k,v in pairs(scheme_config.setup) do
			vim.g[k] = v
		end
	end
	if flavor then
		if scheme_config.flavor_var then
			vim.g[scheme_config.flavor_var] = flavor
		else
			scheme = string.format("%s-%s", scheme, flavor)
		end
	end
	if scheme_config.transparency then
		local trans_conf = scheme_config.transparency
		vim.g[trans_conf.global] = transparency and (trans_conf.value or 1) or 0
	else
		transparency = false
	end
	vim.notify("Setting colorscheme "..scheme.." with "..(transparency and "transparent" or "opaque").." background")
	vim.cmd.colorscheme(scheme)
end

M.setup { colorschemes = require "conf/themez" }
return M

