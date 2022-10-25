 -- _____ _
-- |_   _| |_  ___ _ __  ___ ___
 --  | | | ' \/ -_) '  \/ -_|_-<
 --  |_| |_||_\___|_|_|_\___/__/


----------------------------------- Rose Pine ---------------------------------
Plugin "https://github.com/rose-pine/neovim"
require"rose-pine".setup {
	dark_variant = "moon",
	disable_italics = true,
}

---------------------------------- Solarized -----------------------------------
-- Plugin "https://github.com/shaunsingh/solarized.nvim"
-- let.solarized_italic_comments = true
-- let.solarized_italic_keywords = true
-- let.solarized_italic_functions = false
-- let.solarized_italic_variables = false
-- let.solarized_contrast = false
-- let.solarized_borders = true
-- let.solarized_disable_background = false

Plugin "https://github.com/ishan9299/nvim-solarized-lua"
----------------------------------- Tokyonight --------------------------------
Plugin "https://github.com/folke/tokyonight.nvim"
let.tokyonight_style = 'storm'		-- available: night, storm, day
-- let.tokyonight_transparent = 1

------------------------------------- Nord -------------------------------------

Plugin 'https://github.com/arcticicestudio/nord-vim'
-- https://www.nordtheme.com/docs/ports/vim/configuration
let.nord_cursor_line_number_background = 1
let.nord_bold_vertical_split_line = 1
let.nord_italic = 1
let.nord_italic_comments = 1
let.nord_underline = 1

----------------------------------- Nightfly ----------------------------------

Plugin "https://github.com/bluz71/vim-nightfly-guicolors"
-- let.nightflyCursorColor = 1
let.nightflyTerminalColors = 0		-- Use colorscheme in embeded teminal
let.nightflyUnderlineMatchParen = 1	-- Underline matching parens
-- let.nightflyTransparent = 1		-- Use transparent background

------------------------------------ Sonokai ----------------------------------
Plugin "sainnhe/sonokai"
let.sonokai_style = 'atlantis'
let.sonokai_enable_italic = 1

------------------------------------ Halcyon ----------------------------------
Plugin "kwsp/halcyon-neovim"

----------------------------------- Oceanic Next ------------------------------
Plugin 'mhartington/oceanic-next'
let.oceanic_next_terminal_bold = 1
let.oceanic_next_terminal_italic = 1

----------------------------------- One Dark ----------------------------------
Plugin "https://github.com/joshdick/onedark.vim"

----------------------------------- Gruvbox -----------------------------------
Plugin "https://github.com/luisiacc/gruvbox-baby"

--------------------------------- Papercolor ----------------------------------
Plugin "https://github.com/pappasam/papercolor-theme-slim"

