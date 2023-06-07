local M = {}

local Prefix = "<leader>j"
local Oil = require "oil"

function M.add(items)
	for key,path in pairs(items) do
		nnoremap(Prefix..key, function ()
			Oil.open_float(path)
		end, path)
	end
end

return M
