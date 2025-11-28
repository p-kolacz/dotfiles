vim.api.nvim_create_augroup("vimrc", { clear = true })

function _G.v(x)
	vim.print(x)
end

function Autocmd(commands)
	for k,v in pairs(commands) do
		v["group"] = "vimrc"
		vim.api.nvim_create_autocmd(k, v)
	end
end

function Set(table)
	for k,v in pairs(table) do
		vim.opt[k] = v
	end
end

local M = {}

function Require(t)
	t = type(t) == "table" and t or {t}
	for _,v in ipairs(t) do
		require(v)
	end
end

return M
