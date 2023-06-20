local PLUGIN_HOME = vim.fn.stdpath('data')..'/site/pack/plugozaur/opt/'

local M = {
	-- ["http://asdf.pl"] = { branch = "asdf", after = "asdf" },
	-- "https://github.com/asdfgg/answer",
}

-- string
-- string, function
-- { string }
-- { {string = {} }}
-- Plugin { 
function M.plugin(repos, after)
	repos = type(repos) == "table" and repos or {repos}
	for _,repo in pairs(repos) do
		local t = vim.fn.split(repo, "/")
		local name = t[#t]
		local dir = PLUGIN_HOME..name
		if vim.fn.isdirectory(dir) == 0 then
			vim.cmd(string.format("!git clone --depth 1 %s.git %s", repo, dir))
			vim.cmd("packadd! "..name)
			vim.cmd("helptags ALL")
			if after then
				vim.cmd("!cd "..dir.." && "..after)
			end
		else
			vim.cmd("packadd! "..name)
		end
	end
end

function M.update()
	vim.cmd(string.format([[!find %s* -prune -type d | xargs -P8 -I{} git -C {} pull --quiet]], PLUGIN_HOME))
	vim.cmd('helptags ALL')
end
-- vim.cmd("command! PlugUpdate lua PlugUpdate()")

function M.debug_update()
	vim.cmd(string.format([[!find %s* -prune -type d | xargs -P1 -I{} sh -c "echo -n 'Updating: '; basename {}; git -C {} pull;"]], PLUGIN_HOME))
	vim.cmd('helptags ALL')
end
-- vim.cmd("command! PlugUpdateDebug lua PlugUpdateDebug()")

return M
