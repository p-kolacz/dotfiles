 -- _____ _
-- |_   _| |_  ___ _ __  ___ ___
 --  | | | ' \/ -_) '  \/ -_|_-<
 --  |_| |_||_\___|_|_|_\___/__/


Plugin "https://github.com/catppuccin/nvim"

----------------------------------- Everforest ---------------------------------
Plugin "https://github.com/sainnhe/everforest"
let.everforest_background = 'hard'	-- hard medium soft

------------------------------------ Nightfox ----------------------------------
Plugin "https://github.com/EdenEast/nightfox.nvim"

----------------------------------- Rose Pine ----------------------------------
Plugin "https://github.com/rose-pine/neovim"
require"rose-pine".setup {
	dark_variant = "moon",
	disable_italics = true,
}

---------------------------------- Solarized -----------------------------------
Plugin "https://github.com/ishan9299/nvim-solarized-lua"

----------------------------------- Tokyonight --------------------------------
Plugin "https://github.com/folke/tokyonight.nvim"
let.tokyonight_style = 'storm'		-- available: night, storm, day
-- let.tokyonight_transparent = 1

------------------------------------- Nord -------------------------------------

Plugin 'https://github.com/arcticicestudio/nord-vim'
-- https://www.nordtheme.com/docs/ports/vim/configuration
global {
	nord_cursor_line_number_background = 1,
	nord_bold_vertical_split_line = 1,
	nord_italic = 1,
	nord_italic_comments = 1,
	nord_underline = 1,
}

----------------------------------- Nightfly ----------------------------------

Plugin "https://github.com/bluz71/vim-nightfly-guicolors"
-- let.nightflyCursorColor = 1
let.nightflyTerminalColors = 0		-- Use colorscheme in embeded teminal
let.nightflyUnderlineMatchParen = 1	-- Underline matching parens
-- let.nightflyTransparent = 1		-- Use transparent background

------------------------------------ Sonokai ----------------------------------
Plugin "https://github.com/sainnhe/sonokai"
let.sonokai_style = 'atlantis'
let.sonokai_enable_italic = 1

------------------------------------ Halcyon ----------------------------------
Plugin "https://github.com/kwsp/halcyon-neovim"

----------------------------------- Oceanic Next ------------------------------
Plugin 'https://github.com/mhartington/oceanic-next'
let.oceanic_next_terminal_bold = 1
let.oceanic_next_terminal_italic = 1

----------------------------------- One Dark ----------------------------------
Plugin "https://github.com/joshdick/onedark.vim"

----------------------------------- Gruvbox -----------------------------------
Plugin "https://github.com/luisiacc/gruvbox-baby"

--------------------------------- Papercolor ----------------------------------
Plugin "https://github.com/pappasam/papercolor-theme-slim"

