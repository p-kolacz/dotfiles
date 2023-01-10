require "lib/helpers"
Help = require "lib/helpozor"

Require {
-- Libs --------------------------------
	"lib/plugozaur",
	"lib/mapper",

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
	"lang/rust",
	"lang/sql",
	"lang/sxhkd",
	"lang/webdev",
	"lang/yaml",

}

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end

