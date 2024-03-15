Plugin {
	"https://github.com/tpope/vim-fugitive",
}

local M = {}

function M.browse()
	vim.cmd.GBrowse()
end

function M.commit_with_date()
	vim.cmd('!git add .; git commit -m "$(date +\\%F)"')
end

function M.commits()
	vim.cmd.Gclog("--")
	vim.cmd.copen()
end

function M.file_commits()
	vim.cmd.Gclog("-- %")
	vim.cmd.copen()
end

function M.file_versions()
	vim.cmd.Gclog("-1000")
	vim.cmd.copen()
end

function M.grep()
	vim.ui.input({ prompt = "Git grep: " }, function(input)
		vim.cmd.Ggrep(input)
		vim.cmd.copen()
	end)
end

function M.grep_messages()
	vim.ui.input({ prompt = "Git grep commit messages: " }, function(input)
		vim.cmd.Gclog("--grep="..input.." --")
		vim.cmd.copen()
	end)
end

function M.lazygit()
	vim.cmd("silent !$TERMINAL lazygit &")
end

function M.push()
	vim.cmd("!git push")
end

function M.search4differences()
	vim.ui.input({ prompt = "Git search for differences" }, function(input)
		vim.cmd.Gclog("-S"..input.." --")
		vim.cmd.copen()
	end)
end

function M.gitsigns_next_hunk(gs)
	if vim.wo.diff then return ']c' end
	vim.schedule(function() gs.next_hunk() end)
	return '<Ignore>'
end

function M.gitsigns_prev_hunk(gs)
	if vim.wo.diff then return '[c' end
	vim.schedule(function() gs.prev_hunk() end)
	return '<Ignore>'
end

return M
