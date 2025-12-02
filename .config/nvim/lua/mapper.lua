local function set(mode, lhs, rhs, desc, opts1, opts2)
	opts2 = opts2 or {}
	opts2.desc = desc
	local opts = vim.tbl_extend("keep", opts1, opts2)
	vim.keymap.set(mode, lhs, rhs, opts)
end

function _G.mapgroup(key, desc)
	if WK then
		WK.add({ key,  group = desc })
	end
end
Mapgroup = mapgroup

-- function _G.map(lhs, rhs, desc, opts)              set("",  lhs, rhs, desc, { remap = true }, opts) end
function _G.nmap(lhs, rhs, desc, opts)             set("n", lhs, rhs, desc, { remap = true }, opts) end
-- function _G.cnoremap(lhs, rhs, desc, opts)         set("c", lhs, rhs, desc, {}, opts)               end
-- function _G.inoremap(lhs, rhs, desc, opts)         set("i", lhs, rhs, desc, {}, opts)               end
-- function _G.inoremap_buffer(lhs, rhs, desc, opts)  set("i", lhs, rhs, desc, { buffer = 0  }, opts)  end
function _G.nnoremap(lhs, rhs, desc, opts)         set("n", lhs, rhs, desc, {}, opts)               end
function _G.nnoremap_buffer(lhs, rhs, desc, opts)  set("n", lhs, rhs, desc, { buffer = 0  }, opts)  end
-- function _G.vnoremap(lhs, rhs, desc, opts)         set("v", lhs, rhs, desc, {}, opts)               end
-- function _G.vnoremap_buffer(lhs, rhs, desc, opts)  set("v", lhs, rhs, desc, { buffer = 0  }, opts)  end
-- function _G.xnoremap(lhs, rhs, desc, opts)         set("x", lhs, rhs, desc, {}, opts)               end
-- function _G.xnoremap_buffer(lhs, rhs, desc, opts)  set("x", lhs, rhs, desc, { buffer = 0  }, opts)  end


local M = {}

local function add(maps, opts)
	maps = type(maps[1]) == "table" and maps or {maps}
	opts = opts or {}
	for _,v in ipairs(maps) do
		if v[1] == "G" then
			mapgroup(v[2], v[3])
		else
			opts.desc = v[4]
			vim.keymap.set(v[1], v[2], v[3], opts)
		end
	end
end

function Noremap(maps)
	add(maps)
end

function Map(maps)
	add(maps, { remap = true })
end

function BufferNoremap(maps)
	add(maps, { buffer = true })
end

return M
