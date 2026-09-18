
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

-- Deprecated as of gF
-- function M.gf()
-- 	-- local isfilename_bak = vim.opt.isfname
-- 	-- vim.opt.isfname:remove("@ @")
-- 	local cfile = vim.fn.expand("<cfile>")
-- 	print("CFILE: " .. cfile)
-- 	-- vim.opt.isfname = isfilename_bak
-- 	cfile = cfile:gsub("^[%s#-]+", "")
-- 	print("CFILE: " .. cfile)
-- 	local line = vim.fn.getline(".")
-- 	local lnum = line:match(":(%d*):")

-- 	if cfile and vim.fn.filereadable(cfile) == 1 then
-- 		vim.cmd("edit " .. cfile)
-- 		if lnum then vim.cmd(lnum) end
-- 	else
-- 		vim.cmd("normal! gf") -- fallback to normal gf
-- 	end
-- end

return M
