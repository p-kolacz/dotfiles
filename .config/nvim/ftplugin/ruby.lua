
-- '########::'##::::'##:'########::'##:::'##:
--  ##.... ##: ##:::: ##: ##.... ##:. ##:'##::
--  ##:::: ##: ##:::: ##: ##:::: ##::. ####:::
--  ########:: ##:::: ##: ########::::. ##::::
--  ##.. ##::: ##:::: ##: ##.... ##:::: ##::::
--  ##::. ##:: ##:::: ##: ##:::: ##:::: ##::::
--  ##:::. ##:. #######:: ########::::: ##::::
-- ..:::::..:::.......:::........::::::..:::::

local rubies = require "rubies"

mapgroup("<localleader>s", "+Server")
BufferNoremap {
	-- { "n", "<localleader>ss", ":Server<cr>", "start" },
	-- { "n", "<localleader>sr", ":Rails restart<cr>", "restart" },
	-- { "n", "<localleader>sc", ":Console<cr>" },
	-- { "n", "<localleader>m", ":Emodel<cr>", "model" },
	-- { "n", "<localleader>v", ":Eview<cr>", "view" },
	-- { "n", "<localleader>c", ":Econtroller<cr>", "controller" },
	-- { "n", "<localleader>r", ":e config/routes.rb<cr>", "routes" },
	{ "n", "<localleader>s", rubies.edit_spec_file, "spec" },
	{ "n", "<localleader>b", rubies.edit_main_file, "main" },
	{ "n", "<F5>", rubies.run_spec, "run spec" },
	{ "n", '<M-s>', rubies.quickfix_spec_results },
}

Helper.map {
	API        = "https://api.rubyonrails.org/",
	CHEATSHEET = "https://dev.to/ericchapman/my-beloved-ruby-cheat-sheet-208o",
	DOCSEARCH  = "https://devdocs.io/#q=ruby%20",
}

vim.opt_local.foldcolumn = "0"
vim.opt_local.colorcolumn = "120"

Laser.start {
	name = "ruby-lsp",
	cmd = { "ruby-lsp" },
	-- cmd = { "bundle", "exec", "ruby-lsp", "--stdio", "--disable-gems" },
	-- init_options = {
		-- indexing = {
			-- excludedPatterns = { "vendor/bundle/" },
			-- "includedPatterns"= ["path/to/included/file.rb"],
			-- excludedGems = { "gem1", "gem2", "etc." },
			-- "excludedMagicComments"= ["compiled:true"]
		-- },
	-- },
}

-- vim.lsp.set_log_level("debug")

-- Laser.start {
-- 	name = "Solargraph",
-- 	-- cmd = { "bundle", "exec", "solargraph", "stdio" },
-- 	cmd = { "solargraph", "stdio" },
-- 	init_options = {
-- 		formatting = true
-- 	},
-- 	settings = {
-- 		solargraph = {
-- 			diagnostics = true
-- 		}
-- 	},
-- }


Plugin {
	-- "https://github.com/vim-ruby/vim-ruby",
	"https://github.com/tpope/vim-rails",
	"https://github.com/tpope/vim-bundler",
	"https://github.com/tpope/vim-dispatch",
}

