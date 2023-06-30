-- Weles Dazhbog Dola Zemlya Zvezda Devana Morana
Helper = require "lib/helpozor"
Icons  = require "lib/iconz"
Laser  = require "lib/laserpro"
Mapper = require "lib/mapper"
Pluger = require "lib/plugozaur"
Yanka  = require "lib/yanka"

Plugin = Pluger.plugin

require "lib/bootstrap" {

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
	"tool/perun",
	"tool/zorya",
	"tool/notify",
	"tool/tpope",
	"tool/lsp",
	"tool/completion",
	"tool/ultisnips",
	"tool/treesitter",
	"tool/trouble",
	"tool/telescope",
	"tool/nvim-tree",
	"tool/oil",
	"tool/gitsigns",
	"tool/cheatash",
	"tool/colorizer",
	"tool/figlet",
	"tool/rest",
	"tool/dashboard",
}

--[[
Zorya
--]]

Plugin "https://github.com/stevearc/dressing.nvim"

Jumper = require "lib/jumper"
-- require "lib/animate".setup()

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end

