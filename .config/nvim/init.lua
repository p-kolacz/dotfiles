Help = require "lib/helpozor"
Icons = require "lib/iconz"
Yanka = require "lib/yanka"
LaSerPro = require "lib/laserpro"
require "lib/bootstrap" {

	-- Libs --------------------------------
	"lib/plugozaur",

	-- Configuration -----------------------
	"conf/options",
	"conf/foldotron",
	"conf/which-key",
	"conf/mappings",
	"conf/appearance",
	"conf/statusline",

	-- Tools -------------------------------
	"tool/tpope",
	"tool/lsp",
	"tool/completion",
	"tool/ultisnips",
	"tool/treesitter",
	"tool/trouble",
	"tool/telescope",
	"tool/nvim-tree",
	"tool/gitsigns",
	"tool/help",
	"tool/colorizer",
	"tool/figlet",
	"tool/rest",
	"tool/dashboard",
	-- "tool/neotest",
	"tool/vim-test",
	"tool/indent-guides",

	-- Languages ---------------------------
	"lang/ruby",
	"lang/sql",
	"lang/webdev",
}

-- markdown
let.markdown_fenced_languages = { 'gdscript', 'html', 'css', 'php', 'sh', 'vim' }
vim.cmd[[hi markdownH1 gui=bold,underline]]
vim.cmd[[hi markdownH2 gui=bold,undercurl]]


Plugin {
	-- CSV
	"https://github.com/mechatroner/rainbow_csv",
	-- Plugin "https://github.com/habamax/vim-godot",
	"https://github.com/nvim-orgmode/orgmode",

	-- Ruby
	-- "https://github.com/vim-ruby/vim-ruby",
	"https://github.com/tpope/vim-rails",
	"https://github.com/tpope/vim-bundler",
	"https://github.com/tpope/vim-dispatch",

	"https://github.com/zaid/vim-rec",
	"https://github.com/kovetskiy/sxhkd-vim",
}

LaSerPro.setup(LSP_ON_ATTACH, LSP_CAPABILITIES)

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end

