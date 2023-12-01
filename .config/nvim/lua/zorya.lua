local M = {}
local STATE_FILE = vim.fn.stdpath("state") .. "/zorya"
local config
local state = { scheme = "", flavor = "" }

local function load_state()
	local file = io.open(STATE_FILE)
	if file then
		local lines = file:lines()
		state.scheme = lines()
		state.flavor = lines()
		file:close()
	end
end

local function save_state()
	local file = io.open(STATE_FILE, "w")
	if file then
		file:write(state.scheme, "\n", state.flavor)
		file:close()
	else
		vim.notify(string.format("Unable to open file: %s for writing", STATE_FILE), vim.log.levels.ERROR)
	end
end

local function restore_colorscheme()
	if state.scheme ~= "" then
		M.set_colorscheme(state.scheme, state.flavor)
	end
end

local function setup_colorscheme(conf)
	if not conf.initialized then
		if conf.url then
			Plugin(conf.url)
		end
		if conf.setup then
			conf.setup()
		end
		conf.initialized = true
	end
end

function M.setup(user_config)
	config = user_config
	load_state()

	if config.restore_colorscheme then
		restore_colorscheme()
	end
end

-- function M.auto_background(default)
-- 	vim.o.background = vim.env.THEME_VARIANT and vim.env.THEME_VARIANT or (default or "dark")
-- end

function M.toggle_background()
	vim.o.background = vim.o.background == "light" and "dark" or "light"
end

-- function M.toggle_transparency()
-- 	local current_config = current_scheme_config()
-- 	if current_config and current_config.transparency then
-- 		local transparency_global = current_config.transparency.global
-- 		local current_value = vim.g[transparency_global]
-- 		vim.g[transparency_global] =
-- 			(current_value == nil or current_value == 0)
-- 			and (current_config.transparency.value or 1)
-- 			or 0
-- 	else
-- 		vim.notify("Scheme ".." doesn't support transparency", vim.log.levels.INFO)
-- 	end
-- end

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
	setup_colorscheme(scheme_config)
	if scheme_config.flavor then
		scheme_config.flavor(flavor)
	else
		vim.cmd.colorscheme(scheme)
	end
	state.scheme = scheme
	state.flavor = flavor or ""
	save_state()
	-- if scheme_config.transparency then
	-- 	local trans_conf = scheme_config.transparency
	-- 	vim.g[trans_conf.global] = transparency and (trans_conf.value or 1) or 0
	-- else
	-- 	transparency = false
	-- end
	-- vim.notify("Setting colorscheme "..scheme.." with "..(transparency and "transparent" or "opaque").." background")
	-- vim.notify("Setting colorscheme: "..scheme.." "..flavor)
end

return M
