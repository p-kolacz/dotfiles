local M = {}

function M.commit_with_date()
	vim.cmd('!git add .; git commit -m "$(date +\\%F)"')
end

function M.push()
	vim.cmd("!git push")
end

function M.lazygit()
	vim.cmd("silent !$TERMINAL lazygit &")
end

return M
