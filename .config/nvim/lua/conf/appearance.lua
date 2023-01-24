set.listchars      = Icons.listchars
set.fillchars      = Icons.fillchars
set.cursorline     = true
set.wrap           = false
set.number         = true
set.scrolloff      = 5		-- top and bottom margin in rows
set.sidescrolloff  = 5
set.showmatch      = true
set.signcolumn     = "yes"
set.splitbelow     = true
set.splitright     = true
set.termguicolors  = true
-- set.shortmess:remove("F")

Yanka.enable_highlight()
Icons.setup_diagnostics()
Icons.setup_devicons()

Plugin "https://github.com/RRethy/vim-illuminate"
require "illuminate".configure {
	filetypes_allowlist = {"lua", "rails", "ruby", "sh", },
	min_count_to_highlight = 2,
}
Plugin "https://github.com/petertriho/nvim-scrollbar"
require"scrollbar".setup{
	handlers = {
		cursor = false
	}
}

require "conf/themes"
set.background = vim.env.THEME_VARIANT and vim.env.THEME_VARIANT or "dark"
colorscheme "catppuccin-macchiato"

-- Highlights must be after colorscheme
vim.cmd("highlight Folded gui='italic'")
-- vim.cmd[[highlight ExtraWhitespace ctermbg=red guibg=red]]
-- vim.cmd[[match ExtraWhitespace /\s\+$/]]

-- https://neovide.dev/configuration.html
let.neovide_cursor_animation_length = 0.03

