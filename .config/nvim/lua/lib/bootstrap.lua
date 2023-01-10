_G.let = vim.g
_G.set = vim.opt
_G.setlocal = vim.opt_local
_G.augroup = vim.api.nvim_create_augroup
_G.autocmd = vim.api.nvim_create_autocmd

function _G.colorscheme(name)
	vim.cmd("colorscheme "..name)
end

function _G.v(x)
	print(vim.inspect(x))
end

return function(t)
	for _,v in pairs(t) do
		require(v)
	end
end

