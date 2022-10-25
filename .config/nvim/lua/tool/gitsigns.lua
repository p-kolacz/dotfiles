-- must be after plenary

Plugin 'https://github.com/lewis6991/gitsigns.nvim'

require('gitsigns').setup()

nnoremap('<leader>gp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', 'preview chunk')
nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", "line blame")

