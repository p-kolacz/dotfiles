local M = {}
local PLUGIN_HOME = vim.fn.stdpath('data')..'/site/pack/plugozaur/opt/'
local enabled_plugins = {}

local enable = function(name)
	vim.cmd("packadd! "..name)
	enabled_plugins[name] = true
end

vim.api.nvim_create_augroup("plugozaur", {})
vim.api.nvim_create_autocmd("VimEnter", { group = "plugozaur", callback = function()
	enable = function(name)
		if enabled_plugins[name] then return end
		vim.cmd("packadd "..name)
		enabled_plugins[name] = true
	end
end})

function M.add(repos, after)
	repos = type(repos) == "table" and repos or {repos}
	for _,repo in pairs(repos) do
		local name = string.match(repo, "[^/]+$")
		local dir = PLUGIN_HOME..name
		if vim.fn.isdirectory(dir) == 0 then
			vim.cmd(string.format("!git clone --depth 1 %s.git %s", repo, dir))
			enable(name)
			if after then after(dir) end
			vim.cmd("helptags ALL")
		else
			enable(name)
		end
	end
end

function M.update()
	vim.cmd(string.format([[!find %s* -prune -type d | xargs -P8 -I{} git -C {} pull --quiet]], PLUGIN_HOME))
	vim.cmd('helptags ALL')
end

function M.debug_update()
	vim.cmd(string.format([[!find %s* -prune -type d | xargs -P1 -I{} sh -c "echo -n 'Updating: '; basename {}; git -C {} pull;"]], PLUGIN_HOME))
	vim.cmd('helptags ALL')
end

return M -- original LoC: 37
