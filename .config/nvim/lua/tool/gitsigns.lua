-- must be after plenary

Plugin 'https://github.com/lewis6991/gitsigns.nvim'

local gs = require "gitsigns"

gs.setup{
	trouble = true,
	on_attach = function()
		Cmdr.add {
			{ "Git stage buffer", gs.stage_buffer },
			{ "Git reset buffer", gs.reset_buffer },
			{ "Git set quickfix", "Gitsigns setqflist" },
			{ "Git set loclist", "Gitsigns setloclist" },
		}

		nnoremap(']c', function()
			if vim.wo.diff then return ']c' end
			vim.schedule(function() gs.next_hunk() end)
			return '<Ignore>'
		end, "next hunk", {expr=true})

		nnoremap('[c', function()
			if vim.wo.diff then return '[c' end
			vim.schedule(function() gs.prev_hunk() end)
			return '<Ignore>'
		end, "prev hunk",  {expr=true})

		nnoremap("<leader>gd", gs.toggle_deleted, "toggle deleted")
		nnoremap("<leader>gb", gs.toggle_current_line_blame, "line blame")
		nnoremap('<leader>gp', gs.preview_hunk, "preview chunk")
	end,
}


