local figlet = require "figlet"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local previewers = require "telescope.previewers"

local PREVIEW_TEXT = "The quick brown fox jumps over the lazy dog"

local function attach_mappings(prompt_bufnr, map)
	actions.select_default:replace(function()
		actions.close(prompt_bufnr)
		local selection = action_state.get_selected_entry()
		-- print(vim.inspect(selection))
		vim.api.nvim_put({ selection[1] }, "", false, true)
	end)
	return true
end

local picker_defaults = {
	prompt_title = "Figlet",
	finder = finders.new_table {
		results = figlet.font_list()
	},
	previewer = previewers.new_buffer_previewer({
		define_preview = function(self, entry)
			local str = figlet.generate(PREVIEW_TEXT, entry.value, 80)
			local lines = {}
			for s in str:gmatch("[^\n]+") do
				table.insert(lines, s)
			end
			vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
		end,
	}),
	attach_mappings = attach_mappings,
}
-- local function setup()
-- end

-- setup()
local function run(opts)
	opts = opts or {}
	picker_defaults.sorter = conf.generic_sorter(opts)
	pickers.new(opts, picker_defaults):find()
	-- v(picker_defaults.finder.results)
end

run()
-- return require("telescope").register_extension {
-- 	setup = function()
-- 		setup()
-- 	end,
-- 	exports = {
-- 		figlet = run
-- 	},
-- }
