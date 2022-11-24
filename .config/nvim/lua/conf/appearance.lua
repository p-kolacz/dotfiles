require "lib/iconz"
set.listchars      = Icons.listchars
set.fillchars      = Icons.fillchars
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

-- Define icons highlights for diagnostics
for name, icon in pairs(Icons.diagnostics) do
	name = name:sub(1,1):upper()..name:sub(2)	-- capitalize name
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Highlight yank
autocmd("TextYankPost", { group = "vimrc", pattern = "*", callback =
	function()
		vim.highlight.on_yank {higroup="IncSearch", timeout=500}
	end
})


Plugin "kyazdani42/nvim-web-devicons"
require "nvim-web-devicons".setup()
require "conf/themes"
set.background = vim.env.THEME_VARIANT and vim.env.THEME_VARIANT or "dark"
colorscheme "rose-pine"
-- colorscheme "solarized-flat"
-- colorscheme "PaperColorSlim"

Plugin "https://github.com/RRethy/vim-illuminate"
require "illuminate".configure {
	filetypes_allowlist = {"lua", "rails", "ruby", "sh", },
	filetypes_denylist = {},
	providers = { 'treesitter', 'regex' },
	min_count_to_highlight = 2,
}
Plugin "https://github.com/petertriho/nvim-scrollbar"
require"scrollbar".setup()


-- Highlights must be after colorscheme
vim.cmd("highlight Folded gui='italic'")
-- vim.cmd[[highlight ExtraWhitespace ctermbg=red guibg=red]]
-- vim.cmd[[match ExtraWhitespace /\s\+$/]]

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

