-- package.loaded['marketeer'] = nil
local M = {}

local Defaults = {
	global_name = 'global_mark',
	local_name = 'local_mark',
	global_mark = '',
	local_mark = '',
	group = 'marketeer',
	priority = 7,
}

local config = {}

local next_id = 1

local function define_sign(name, text)
	vim.fn.sign_define(name, { text = text })
end

local function set_sign(id, group, name, lnum, priority)
	vim.fn.sign_place(id, group, name, vim.fn.bufname(), {lnum = lnum, priority = priority})
end

local function remove_signs(group)
	vim.fn.sign_unplace(group)
end

local function add_global_marks()
	local global_marks = vim.fn.getmarklist()
	for _,v in ipairs(global_marks) do
		-- print(vim.fn.expand(v.file), vim.fn.expand('%:p'))
		if vim.fn.expand(v.file) == vim.fn.expand('%:p') then
			if v.mark:gmatch("'[A-Z]")() then
				-- print('fff', v.mark)
				local lnum = v.pos[2]
				set_sign(next_id, config.group, config.global_name, lnum, config.priority)
				next_id = next_id + 1
			end
		end
	end
end

local function add_local_marks()
	local local_marks = vim.fn.getmarklist(vim.fn.bufname())
	for _,v in ipairs(local_marks) do
		-- print(vim.fn.expand(v.file), vim.fn.expand('%:p'))
		if v.mark:gmatch("'[a-z]")() then
			-- print('fff', v.mark)
			local lnum = v.pos[2]
			set_sign(next_id, config.group, config.local_name, lnum, config.priority)
			next_id = next_id + 1
		end
	end
end

function M.setup(user_config)
	if not user_config then
		config = Defaults
	else
		for k,_ in pairs(Defaults) do
			config[k] = user_config[k] or Defaults[k]
		end
	end
	define_sign(config.global_name, config.global_mark)
	define_sign(config.local_name, config.local_mark)
	vim.cmd('augroup marketeer | autocmd! | augroup END')
	vim.cmd('autocmd marketeer BufWinEnter * lua require"lib/marketeer".refresh()')
end

function M.refresh()
	remove_signs(config.group)
	add_global_marks()
	add_local_marks()
end

-- M.setup()
return M

