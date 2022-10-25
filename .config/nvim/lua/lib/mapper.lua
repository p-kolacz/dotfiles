-- TODO: add table as lhs
local function set(mode, lhs, rhs, desc, opts)
	if desc and WK then
		opts.silent = false
		opts.mode = mode
		desc = desc == "" and "which_key_ignore" or desc
		WK.register({ [lhs] = { rhs, desc }}, opts)
	elseif type(rhs) == "string" then
		if opts.buffer then
			opts.buffer = nil
			vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
		else
			vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
		end
	-- else
		-- print("invalid rhs for: "..lhs)
	end
end

function _G.mapgroup(key, desc)
	if WK then
		WK.register({ [key] = { name = desc }})
	end
end

function _G.map(lhs, rhs, desc)              set("",  lhs, rhs, desc, { noremap = false })             end
function _G.nmap(lhs, rhs, desc)             set("n", lhs, rhs, desc, { noremap = false })             end
function _G.cnoremap(lhs, rhs, desc)         set("c", lhs, rhs, desc, { noremap = true  })             end
function _G.inoremap(lhs, rhs, desc)         set("i", lhs, rhs, desc, { noremap = true  })             end
function _G.inoremap_buffer(lhs, rhs, desc)  set("i", lhs, rhs, desc, { noremap = true, buffer = 0  }) end
function _G.nnoremap(lhs, rhs, desc)         set("n", lhs, rhs, desc, { noremap = true  })             end
function _G.nnoremap_buffer(lhs, rhs, desc)  set("n", lhs, rhs, desc, { noremap = true, buffer = 0  }) end
function _G.vnoremap(lhs, rhs, desc)         set("v", lhs, rhs, desc, { noremap = true  })             end
function _G.vnoremap_buffer(lhs, rhs, desc)  set("v", lhs, rhs, desc, { noremap = true, buffer = 0  }) end
function _G.xnoremap(lhs, rhs, desc)         set("x", lhs, rhs, desc, { noremap = true  })             end
function _G.xnoremap_buffer(lhs, rhs, desc)  set("x", lhs, rhs, desc, { noremap = true, buffer = 0  }) end

