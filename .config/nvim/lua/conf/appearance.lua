set.listchars      = "space:⋅,tab:├─>,eol:↲,nbsp:+,trail:•,extends:⟩,precedes:⟨"
vim.opt.fillchars      = {
	fold = " ", foldopen = "", foldclose = "",
	horiz = "═", horizdown = "╦", horizup = "╩",
	vert = "║", vertright = "╠", verthoriz = "╬", vertleft = "╣",
}
-- set.cursorline     = true
set.wrap           = false
set.number         = true
set.scrolloff      = 5		-- top and bottom margin in rows
set.showmatch      = true
set.signcolumn     = "yes"
set.splitbelow     = true
set.splitright     = true
set.termguicolors  = true
set.foldcolumn     = "auto"
-- set.shortmess:remove("F")

-- Highlight yank
-- vim.cmd([[autocmd vimrc TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}]])
autocmd("TextYankPost", { group = "vimrc", pattern = "*", callback =
	function()
		vim.highlight.on_yank {higroup="IncSearch", timeout=500}
	end
})
-- vim.cmd[[highlight ExtraWhitespace ctermbg=red guibg=red]]
-- vim.cmd[[match ExtraWhitespace /\s\+$/]]

Plugin "kyazdani42/nvim-web-devicons"
require "nvim-web-devicons".setup()
require "lib/iconz"
require "conf/themes"
set.background = vim.env.THEME_VARIANT and vim.env.THEME_VARIANT or "dark"
colorscheme "rose-pine"
-- colorscheme "solarized-flat"
-- colorscheme "PaperColorSlim"

-- Highlight words under cursor
Plugin "https://github.com/xiyaowong/nvim-cursorword"


-- Highlights must be after colorscheme
vim.cmd("highlight Folded gui='italic'")

-- Plugin "https://github.com/lukas-reineke/indent-blankline.nvim"
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- require"indent_blankline".setup {
	-- filetype = {"yaml"},
	-- show_current_context = true,
	-- show_current_context_start = true,
	-- char_highlight_list = {
        -- "IndentBlanklineIndent1",
        -- "IndentBlanklineIndent2",
        -- "IndentBlanklineIndent3",
        -- "IndentBlanklineIndent4",
        -- "IndentBlanklineIndent5",
        -- "IndentBlanklineIndent6",
    -- },
-- }
