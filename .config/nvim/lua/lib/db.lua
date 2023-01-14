local M = {}

local parser = {
	["# "] = function() end,
	["% "] = function()
	end,
	[""] = function()
		
	end,
	
}

function M.query(query)
	
end


function M.parse(table)
	for _,line in table do
		local line_start = string.sub(line, 1, 2)
	end
end

return M
