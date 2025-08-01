local function get_spec_file()
	local current_file = vim.fn.expand('%')
	local spec_file = string.gsub(current_file, "app", "spec")
	spec_file = string.gsub(spec_file, ".rb$", "_spec.rb")
	return spec_file
end

local function get_main_file()
	local current_file = vim.fn.expand('%')
	local spec_file = string.gsub(current_file, "spec", "app", 1)
	spec_file = string.gsub(spec_file, "_spec", "")
	return spec_file
end

local function run_spec()
	vim.cmd.wall()
	vim.cmd("tab term rime spec "..vim.fn.expand("%:."))
	-- vim.cmd.startinsert()
end

mapgroup("<localleader>s", "+Server")
BufferNoremap {
	-- { "n", "<localleader>ss", ":Server<cr>", "start" },
	-- { "n", "<localleader>sr", ":Rails restart<cr>", "restart" },
	-- { "n", "<localleader>sc", ":Console<cr>" },
	-- { "n", "<localleader>m", ":Emodel<cr>", "model" },
	-- { "n", "<localleader>v", ":Eview<cr>", "view" },
	-- { "n", "<localleader>c", ":Econtroller<cr>", "controller" },
	-- { "n", "<localleader>r", ":e config/routes.rb<cr>", "routes" },
	{ "n", "<localleader>s", function () vim.cmd.edit(get_spec_file()) end, "spec" },
	{ "n", "<localleader>b", function () vim.cmd.edit(get_main_file()) end, "main" },
	{ "n", "<localleader>r", run_spec, "run spec" },
	{ "n", "<F5>", run_spec, "run spec" },
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

nnoremap_buffer('<M-s>', ':cgetfile tmp/quickfix.out | cwindow | cfirst<cr>')

Plugin {
	-- "https://github.com/vim-ruby/vim-ruby",
	"https://github.com/tpope/vim-rails",
	"https://github.com/tpope/vim-bundler",
	"https://github.com/tpope/vim-dispatch",
}

