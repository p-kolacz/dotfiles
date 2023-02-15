local figlet = require "figlet"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local previewers = require "telescope.previewers"

local PREVIEW_TEXT = {
	"1234567890",
	"The quick brown fox jumps over the lazy dog",
}

local picker_defaults = {
	prompt_title = "Figlet",
	finder = finders.new_table {
		results = figlet.font_list()
	},
	previewer = previewers.new_buffer_previewer({
		define_preview = function(self, entry)
			local lines = {}
			for _,v in ipairs(PREVIEW_TEXT) do
				local str = figlet.generate(v, entry.value, 80)
				for s in str:gmatch("[^\n]+") do
					table.insert(lines, s)
				end
			end
			vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
		end,
	}),
	attach_mappings = function(prompt_bufnr)
		actions.select_default:replace(function()
			actions.close(prompt_bufnr)
			local selection = action_state.get_selected_entry()
			local font = selection[1]
			local str = vim.api.nvim_get_current_line()
			local out = figlet.generate(str, font)
			if out ~= "" then
				local lines = {}
				for line in out:gmatch("[^\n]+") do
					table.insert(lines, line)
				end
				local line_no = vim.fn.line(".")
				vim.api.nvim_del_current_line()
				vim.api.nvim_buf_set_lines(0, line_no, line_no, false, lines)
			else
				error("Error generating figlet")
			end
		end)
		return true
	end,
}

local function run(opts)
	opts = opts or {}
	picker_defaults.sorter = conf.generic_sorter(opts)
	pickers.new(opts, picker_defaults):find()
end

-- run()
return require("telescope").register_extension {
	-- setup = function()
		-- setup()
	-- end,
	exports = {
		figlet = run
	},
}
