-- Perun Weles Dazhbog Dola Zemlya Zorya Zvezda Devana Morana
Helper = require "lib/helpozor"
Icons  = require "lib/iconz"
Laser  = require "lib/laserpro"
Mapper = require "lib/mapper"
Pluger = require "lib/plugozaur"
Cmdr   = require "lib/commander"
Yanka  = require "lib/yanka"
Zorya  = require "zorya"
Zorya.setup { colorschemes = require "conf/themez" }


Plugin = Pluger.plugin

require "lib/bootstrap" {

	-- Configuration -----------------------
	"conf/options",
	"conf/commands",
	"conf/foldotron",
	"conf/which-key",
	"conf/mappings",
	"conf/commander",
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
	"tool/notify",
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

Jumper = require "lib/jumper"
-- require "lib/animate".setup()

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end

