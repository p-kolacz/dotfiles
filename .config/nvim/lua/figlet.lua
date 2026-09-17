local M = {}

local GEN_CMD = "figlet %s -f %s -- %s"

function M.font_list()
	local handle = io.popen("figlist | tail -n +4")
	if handle then
		local ret = {}
		for line in handle:lines() do
			table.insert(ret, line)
		end
		handle:close()
		return ret
	end
	return {}
end

function M.generate(str, font, width)
	width = width and "-w "..width or "-t"
	font = font or "standard"
	local handle = io.popen(GEN_CMD:format(width, font, str))
	if handle then
		local ret = handle:read("*a")
		handle:close()
		return ret
	end
	return ""
end

-- print(M.generate("The quick brown fox jumps over the lazy dog", 'mini'))
return M
