local M = {}

local Prefix = "<leader>j"
-- local Oil = require "oil"
local tree = require('nvim-tree.api').tree

function M.add(items)
	for key,path in pairs(items) do
		nnoremap(Prefix..key, function ()
			-- Oil.open(path)
			tree.find_file({
				buf = path,
				open = true,
				focus = true,
			})
		end, path)
	end
end

return M
