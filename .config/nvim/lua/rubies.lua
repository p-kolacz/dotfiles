--       ___           ___                                     ___           ___
--      /  /\         /__/\         _____        ___          /  /\         /  /\
--     /  /::\        \  \:\       /  /::\      /  /\        /  /:/_       /  /:/_
--    /  /:/\:\        \  \:\     /  /:/\:\    /  /:/       /  /:/ /\     /  /:/ /\
--   /  /:/~/:/    ___  \  \:\   /  /:/~/::\  /__/::\      /  /:/ /:/_   /  /:/ /::\
--  /__/:/ /:/___ /__/\  \__\:\ /__/:/ /:/\:| \__\/\:\__  /__/:/ /:/ /\ /__/:/ /:/\:\
--  \  \:\/:::::/ \  \:\ /  /:/ \  \:\/:/~/:/    \  \:\/\ \  \:\/:/ /:/ \  \:\/:/~/:/
--   \  \::/~~~~   \  \:\  /:/   \  \::/ /:/      \__\::/  \  \::/ /:/   \  \::/ /:/
--    \  \:\        \  \:\/:/     \  \:\/:/       /__/:/    \  \:\/:/     \__\/ /:/
--     \  \:\        \  \::/       \  \::/        \__\/      \  \::/        /__/:/
--      \__\/         \__\/         \__\/                     \__\/         \__\/


local M = {}
local SPEC_RESULTS = "tmp/quickfix.out"

local function is_spec_file(file)
	return string.match(file, "_spec%.rb$") ~= nil
end

function M.edit_spec_file()
	local spec_file = M.get_spec_file()
	vim.cmd.edit(spec_file)
end

function M.edit_main_file()
	local main_file = M.get_main_file()
	vim.cmd.edit(main_file)
end

function M.get_spec_file()
	local current_file = vim.fn.expand('%')
	if is_spec_file(current_file) then return current_file end
	local spec_file = string.gsub(current_file, "app", "spec")
	spec_file = string.gsub(spec_file, ".rb$", "_spec.rb")
	return spec_file
end

function M.get_main_file()
	local current_file = vim.fn.expand('%')
	if not is_spec_file(current_file) then return current_file end

	local main_file = string.gsub(current_file, "spec", "app", 1)
	main_file = string.gsub(main_file, "_spec", "")
	return main_file
end

function M.quickfix_spec_results()
	 vim.cmd("cgetfile " .. SPEC_RESULTS)
	 vim.cmd("cwindow")
	 vim.cmd("cfirst")
	 -- vim.cmd.cfile(SPEC_RESULTS)
end

function M.run_spec()
	vim.cmd.wall()

	local spec_file = M.get_spec_file()
	if vim.fn.filereadable(spec_file) == 1 then
		vim.cmd("tab term rime spec " .. spec_file)
	else
		print("Spec file does not exist: " .. spec_file)
	end
end

return M
