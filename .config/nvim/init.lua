Help = require "lib/helpozor"
Icons = require "lib/iconz"
Yanka = require "lib/yanka"
LaSerPro = require"lib/laserpro"
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
	"tool/neovide",
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
	"lang/csv",
	"lang/gdscript",
	"lang/go",
	"lang/markdown",
	"lang/org-mode",
	"lang/python",
	"lang/recutils",
	"lang/ruby",
	"lang/sql",
	"lang/sxhkd",
	"lang/webdev",
}

LaSerPro.setup(LSP_ON_ATTACH, LSP_CAPABILITIES)

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end

