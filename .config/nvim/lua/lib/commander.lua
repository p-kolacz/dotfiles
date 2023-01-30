local pickers = require "telescope.pickers"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function entry_maker(entry)
	return {
		value = entry,
		display = entry[1],
		ordinal = entry[1],
	}
end

local function attach_mappings(prompt_bufnr)
	actions.select_default:replace(function()
		actions.close(prompt_bufnr)
		local selection = action_state.get_selected_entry()
		local cmd = selection.value[2]
		if type(cmd) == "function" then
			cmd()
		else
			vim.cmd(cmd)
		end
	end)
	return true
end

local commands = {}
local picker_defaults = {
	prompt_title = "Your wish is my :command",
	attach_mappings = attach_mappings,
}

local M = {}

function M.setup(user_commands)
	commands = user_commands
	-- commands = #commands == 0 or {{ "Please provide commands", function() print("Example command") end }}
	local finders = require "telescope.finders"
	local themes = require "telescope.themes"
	picker_defaults.finder = finders.new_table {
		results = commands,
		entry_maker = entry_maker,
	}
	picker_defaults = vim.tbl_deep_extend("keep", picker_defaults, themes.get_dropdown{})
end

function M.run(opts)
	opts = opts or {}
	picker_defaults.sorter = conf.generic_sorter(opts)
	pickers.new(opts, picker_defaults):find()
end

return M
