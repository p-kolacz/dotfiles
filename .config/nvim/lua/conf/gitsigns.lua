-- Independent

Plugin  "https://github.com/lewis6991/gitsigns.nvim"

local gitsigns = require('gitsigns')

gitsigns.setup{
	on_attach = function(bufnr)
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
			if vim.wo.diff then
				vim.cmd.normal({']c', bang = true})
			else
				gitsigns.nav_hunk('next')
			end
		end)

		map('n', '[c', function()
			if vim.wo.diff then
				vim.cmd.normal({'[c', bang = true})
			else
				gitsigns.nav_hunk('prev')
			end
		end)

		-- Actions
		-- TODO: map commented ones
		map('n', '<leader>gsh', gitsigns.stage_hunk, { desc = "stage hunk" })
		map('n', '<leader>grh', gitsigns.reset_hunk, { desc = "reset hunk" })
		map('v', '<leader>gsh', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "stage hunk" })
		map('v', '<leader>grs', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "reset hunk" })
		map('n', '<leader>gsb', gitsigns.stage_buffer, { desc = "stage buffer" })
		map('n', '<leader>guh', gitsigns.undo_stage_hunk, { desc = "undo stage hunk" })
		map('n', '<leader>grb', gitsigns.reset_buffer, { desc = "reset buffer" })
		map('n', '<leader>gh', gitsigns.preview_hunk, { desc = "preview hunk" })
		-- map('n', '<leader>gb', function() gitsigns.blame_line{full=true} end, { desc = "blame line" })
		-- map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "toggle blame" })
		-- map('n', '<leader>hd', gitsigns.diffthis, { desc = "diff this" })
		-- map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = "diff this ~" })
		-- map('n', '<leader>td', gitsigns.toggle_deleted, { desc = "toggle deleted" })

		-- Text object
		map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "select hunk" })
	end
}

return gitsigns
