local M = {}

local Parser = {
	["# "]   = function(_) end,		-- comment
	[""]     = function(_) end,		-- empty line
	["% "]   = function(line)		-- statement
	end,
	default  = function(line)		-- record
		
	end,
}

setmetatable(Parser, {
	__index = function(t,k)
		return t[k] or t.default
	end
})

function M.parse(table)
	for _,line in table do
		local line_start = string.sub(line, 1, 2)
		Parser[line_start](string.sub(line, 3))
	end
end

return M
