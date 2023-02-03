set.listchars      = Icons.listchars
set.fillchars      = Icons.fillchars
set.cursorline     = true
set.wrap           = false
set.number         = true
set.scrolloff      = 5
set.sidescrolloff  = 5
set.showmatch      = true
set.signcolumn     = "yes"
set.splitbelow     = true
set.splitright     = true
set.termguicolors  = true
-- set.shortmess:remove("F")

Icons.setup_devicons()
Icons.setup_diagnostics()
Yanka.enable_highlight()
Zorya.auto_background()

Plugin "https://github.com/RRethy/vim-illuminate"
require "illuminate".configure {
	filetypes_allowlist = { "lua", "rails", "ruby", "sh", },
	min_count_to_highlight = 2,
}
Plugin "https://github.com/petertriho/nvim-scrollbar"
require"scrollbar".setup { handlers = { cursor = false } }

Plugin "https://github.com/lukas-reineke/indent-blankline.nvim"

require "conf/themes"
colorscheme "catppuccin-macchiato"

-- Highlights must be after colorscheme
vim.cmd("highlight Folded gui='italic'")

