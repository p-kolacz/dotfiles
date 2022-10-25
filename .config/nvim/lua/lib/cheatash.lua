local M = {}

local CURL = 'curl https://cheat.sh/'

function M.cword()
	local ft = vim.bo.filetype
	local cw = vim.fn.expand('<cword>')
	vim.cmd('split')
	vim.cmd(string.format('terminal %s%s/%s', CURL, ft, cw))
end

function M.query(keywords)
	keywords = string.gsub(keywords, '%s', '+')
	local ft = vim.bo.filetype
	vim.cmd('split')
	vim.cmd(string.format('terminal %s%s/%s', CURL, ft, keywords))
end

function M.setup()
	vim.cmd('command! -nargs=0 CheatshCword lua require"lib/cheatash".cword()')
	vim.cmd('command! -nargs=+ Cheatsh lua require"lib/cheatash".query(<q-args>)')
end

return M

