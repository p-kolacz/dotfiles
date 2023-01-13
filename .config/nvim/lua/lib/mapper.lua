local function set(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end

function _G.mapgroup(key, desc)
	if WK then
		WK.register({ [key] = { name = desc }})
	end
end

function _G.map(lhs, rhs, desc)              set("",  lhs, rhs, desc, { remap = true }) end
function _G.nmap(lhs, rhs, desc)             set("n", lhs, rhs, desc, { remap = true }) end
function _G.cnoremap(lhs, rhs, desc)         set("c", lhs, rhs, desc)                   end
function _G.inoremap(lhs, rhs, desc)         set("i", lhs, rhs, desc)                   end
function _G.inoremap_buffer(lhs, rhs, desc)  set("i", lhs, rhs, desc, { buffer = 0  })  end
function _G.nnoremap(lhs, rhs, desc)         set("n", lhs, rhs, desc)                   end
function _G.nnoremap_buffer(lhs, rhs, desc)  set("n", lhs, rhs, desc, { buffer = 0  })  end
function _G.vnoremap(lhs, rhs, desc)         set("v", lhs, rhs, desc)                   end
function _G.vnoremap_buffer(lhs, rhs, desc)  set("v", lhs, rhs, desc, { buffer = 0  })  end
function _G.xnoremap(lhs, rhs, desc)         set("x", lhs, rhs, desc)                   end
function _G.xnoremap_buffer(lhs, rhs, desc)  set("x", lhs, rhs, desc, { buffer = 0  })  end

return function(maps)
	for i = 1, #maps, 4 do
		if maps[i] == "G" then
			mapgroup(maps[i+1], maps[i+2])
		else
			vim.keymap.set(maps[i], maps[i+1], maps[i+2], { desc = maps[i+3] })
		end
	end
end

