local function set(mode, lhs, rhs, desc, opts1, opts2)
	opts2 = opts2 or {}
	opts2.desc = desc
	local opts = vim.tbl_extend("keep", opts1, opts2)
	vim.keymap.set(mode, lhs, rhs, opts)
end

function _G.mapgroup(key, desc)
	if WK then
		WK.register({ [key] = { name = desc }})
	end
end

function _G.map(lhs, rhs, desc, opts)              set("",  lhs, rhs, desc, { remap = true }, opts) end
function _G.nmap(lhs, rhs, desc, opts)             set("n", lhs, rhs, desc, { remap = true }, opts) end
function _G.cnoremap(lhs, rhs, desc, opts)         set("c", lhs, rhs, desc, {}, opts)               end
function _G.inoremap(lhs, rhs, desc, opts)         set("i", lhs, rhs, desc, {}, opts)               end
function _G.inoremap_buffer(lhs, rhs, desc, opts)  set("i", lhs, rhs, desc, { buffer = 0  }, opts)  end
function _G.nnoremap(lhs, rhs, desc, opts)         set("n", lhs, rhs, desc, {}, opts)               end
function _G.nnoremap_buffer(lhs, rhs, desc, opts)  set("n", lhs, rhs, desc, { buffer = 0  }, opts)  end
function _G.vnoremap(lhs, rhs, desc, opts)         set("v", lhs, rhs, desc, {}, opts)               end
function _G.vnoremap_buffer(lhs, rhs, desc, opts)  set("v", lhs, rhs, desc, { buffer = 0  }, opts)  end
function _G.xnoremap(lhs, rhs, desc, opts)         set("x", lhs, rhs, desc, {}, opts)               end
function _G.xnoremap_buffer(lhs, rhs, desc, opts)  set("x", lhs, rhs, desc, { buffer = 0  }, opts)  end


local function map_table(maps, buffer)
	local opts = { buffer = buffer }
	for i = 1, #maps, 4 do
		if maps[i] == "G" then
			mapgroup(maps[i+1], maps[i+2])
		else
			opts.desc = maps[i+3]
			vim.keymap.set(maps[i], maps[i+1], maps[i+2], opts)
		end
	end
end

local M = {}

function M.map(maps)
	map_table(maps, false)
end

function M.map_buffer(maps)
	map_table(maps, true)
end

return M
