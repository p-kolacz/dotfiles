require "lib/helpers"
require "lib/plugozaur"
require "lib/mapper"
Help = require "lib/helpozor"

Require {

-- Configuration -----------------------
	"conf/options",
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
	"tool/telescope",
	"tool/nvim-tree",
	"tool/gitsigns",
	"tool/trouble",
	"tool/help",
	"tool/colorizer",
	"tool/figlet",
	"tool/rest",
	"tool/dashboard",

-- Languages ---------------------------
	"lang/bash",
	"lang/csv",
	"lang/gdscript",
	"lang/go",
	"lang/lua",
	"lang/markdown",
	"lang/org-mode",
	"lang/php",
	"lang/python",
	"lang/recutils",
	"lang/ruby",
	"lang/sql",
	"lang/sxhkd",
	"lang/webdev",
	"lang/yaml",

}

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end

