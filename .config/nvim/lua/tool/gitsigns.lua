-- must be after plenary

Plugin 'https://github.com/lewis6991/gitsigns.nvim'

local gs = require "gitsigns"

gs.setup{
	trouble = true,
	on_attach = function()

		nnoremap_buffer(']c', function()
			if vim.wo.diff then return ']c' end
			vim.schedule(function() gs.next_hunk() end)
			return '<Ignore>'
		end, "next hunk", {expr=true})

		nnoremap_buffer('[c', function()
			if vim.wo.diff then return '[c' end
			vim.schedule(function() gs.prev_hunk() end)
			return '<Ignore>'
		end, "prev hunk",  {expr=true})

		nnoremap_buffer("<leader>gd", gs.toggle_deleted, "toggle deleted")
		-- nnoremap_buffer("<leader>gb", gs.toggle_current_line_blame, "line blame")
		nnoremap_buffer("<leader>gb", gs.blame_line, "line blame")
		nnoremap_buffer('<leader>gp', gs.preview_hunk, "preview chunk")
	end,
}

Perun.add {
	{ "  Git stage buffer", gs.stage_buffer },
	{ "  Git reset buffer", gs.reset_buffer },
	{ "  Git set quickfix", "Gitsigns setqflist" },
	{ "  Git set loclist",  "Gitsigns setloclist" },
	{ "  Git blame line",  "Gitsigns blame_line" },
	{ "  Git toggle line blame",  "Gitsigns toggle_current_line_blame" },
}

