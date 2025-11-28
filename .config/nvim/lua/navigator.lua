
-- '##::: ##::::'###::::'##::::'##:'####::'######::::::'###::::'########::'#######::'########::
--  ###:: ##:::'## ##::: ##:::: ##:. ##::'##... ##::::'## ##:::... ##..::'##.... ##: ##.... ##:
--  ####: ##::'##:. ##:: ##:::: ##:: ##:: ##:::..::::'##:. ##::::: ##:::: ##:::: ##: ##:::: ##:
--  ## ## ##:'##:::. ##: ##:::: ##:: ##:: ##::'####:'##:::. ##:::: ##:::: ##:::: ##: ########::
--  ##. ####: #########:. ##:: ##::: ##:: ##::: ##:: #########:::: ##:::: ##:::: ##: ##.. ##:::
--  ##:. ###: ##.... ##::. ## ##:::: ##:: ##::: ##:: ##.... ##:::: ##:::: ##:::: ##: ##::. ##::
--  ##::. ##: ##:::: ##:::. ###::::'####:. ######::: ##:::: ##:::: ##::::. #######:: ##:::. ##:
-- ..::::..::..:::::..:::::...:::::....:::......::::..:::::..:::::..::::::.......:::..:::::..::

local M = {}

local Prefix = "<leader>j"
local tree = require('nvim-tree.api').tree

function M.add(items)
	for key,path in pairs(items) do
		vim.keymap.set("n", Prefix..key, function ()
			tree.find_file({
				buf = path,
				open = true,
				focus = true,
			})
		end, { desc = path })
	end
end

function M.goto_init()
	vim.cmd.edit(vim.fn.stdpath('config')..'/init.lua')
end

function M.goto_ft()
	vim.cmd.edit(string.format('%s/ftplugin/%s.lua', vim.fn.stdpath('config'), vim.o.filetype))
end

function M.gf()
	local cfile = vim.fn.expand("<cfile>")
	cfile = cfile:gsub("^[%s#-]+", "")
	local line = vim.fn.getline(".")
	local lnum = line:match(":(%d*):")

	if cfile and vim.fn.filereadable(cfile) == 1 then
		vim.cmd("edit " .. cfile)
		if lnum then vim.cmd(lnum) end
	else
		vim.cmd("normal! gf") -- fallback to normal gf
	end
end

return M
