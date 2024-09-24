local M = {}
local PLUGIN_HOME = vim.fn.stdpath('data')..'/site/pack/plugozaur/opt/'
local enabled_plugins = {}
local packadd_cmd = "packadd! "

local enable = function(name, dir, config)
	if enabled_plugins[name] then return end
	vim.cmd(packadd_cmd..name)
	if config then config(dir) end
	enabled_plugins[name] = true
end

vim.api.nvim_create_augroup("plugozaur", {})
vim.api.nvim_create_autocmd("VimEnter", { group = "plugozaur", callback = function()
	packadd_cmd = "packadd "
end})

function M.add(repos)
	local regenerate_helptags = false
	repos = type(repos) == "table" and repos or {repos}
	for _,repo in pairs(repos) do
		repo = type(repo) == "table" and repo or {repo}
		local name = string.match(repo[1], "[^/]+$")
		local dir = PLUGIN_HOME..name
		if vim.fn.isdirectory(dir) == 0 then
			vim.cmd(string.format("!GIT_WORK_TREE=%s git clone --depth 1 %s.git %s", dir, repo[1], dir))
			if repo.build then repo.build(dir) end
			regenerate_helptags = true
		end
		enable(name, dir, repo.config)
	end
	if regenerate_helptags then vim.cmd("helptags ALL") end
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
