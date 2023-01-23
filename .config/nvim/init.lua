Help     = require "lib/helpozor"
Icons    = require "lib/iconz"
Yanka    = require "lib/yanka"
LaSerPro = require "lib/laserpro"

require "lib/bootstrap" {

	-- Libs --------------------------------
	"lib/plugozaur",

	-- Configuration -----------------------
	"conf/options",
	"conf/commands",
	"conf/foldotron",
	"conf/which-key",
	"conf/mappings",
	"conf/appearance",
	"conf/statusline",
	"conf/languages",

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
	"tool/cheatash",
	"tool/colorizer",
	"tool/figlet",
	"tool/rest",
	"tool/dashboard",
	-- "tool/neotest",
	"tool/vim-test",
	"tool/indent-guides",
}

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end

