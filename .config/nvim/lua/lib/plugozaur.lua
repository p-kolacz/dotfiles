local PLUGIN_HOME = vim.fn.stdpath('data')..'/site/pack/all/opt/'
local GIHUB_URL = 'https://github.com/'

function Plugin(repos)
	repos = type(repos) == "table" and repos or {repos}
	for _,repo in pairs(repos) do
		local t = vim.fn.split(repo, '/')
		local name = t[#t]
		local dir = PLUGIN_HOME..name
		if vim.fn.isdirectory(dir) == 0 then
			repo = repo:find("https://") == 1 and repo or GIHUB_URL..repo
			vim.cmd(string.format('!git clone --depth 1 %s.git %s', repo, dir))
			vim.cmd('packadd! '..name)
			vim.cmd('helptags ALL')
			-- TODO: add after
			-- if after then after() end
		else
			vim.cmd('packadd! '..name)
		end
	end
end

function PlugUpdate()
	-- vim.cmd(string.format([[!ls -d %s* | xargs -I{} sh -c "echo Updating: $(basename '{}'); git -C {} pull;"]], PLUGIN_HOME))
	vim.cmd(string.format([[!find %s* -prune -type d | xargs -P1 -I{} sh -c "echo -n 'Updating: '; basename {}; git -C {} pull;"]], PLUGIN_HOME))
	-- vim.cmd(string.format([[!find %s* -prune -type d | xargs -P10 -I{} git -C {} pull]], PLUGIN_HOME))
	vim.cmd('helptags ALL')
end
vim.cmd("command! PlugUpdate lua PlugUpdate()")

