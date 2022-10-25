local M = {}

local URL="https://caniuse.com/?search="

function M.cword()
	local cw = vim.fn.expand('<cword>')
	vim.cmd(string.format(':silent !xdg-open "%s%s"', URL, cw))
end

function M.query(keywords)
	keywords = string.gsub(keywords, '%s', '+')
	vim.cmd(string.format(':silent !xdg-open "%s%s"', URL, keywords))
end

function M.setup()
	vim.cmd('command! -nargs=0 CaniuseCword lua require"lib/caniuse".cword()')
	vim.cmd('command! -nargs=+ Caniuse lua require"lib/caniuse".query(<q-args>)')
end

return M

