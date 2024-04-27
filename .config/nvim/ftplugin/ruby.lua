mapgroup("<localleader>s", "+Server")
BufferNoremap {
	{ "n", "<localleader>ss", ":Server<cr>", "start" },
	{ "n", "<localleader>sr", ":Rails restart<cr>", "restart" },
	{ "n", "<localleader>sc", ":Console<cr>" },
	{ "n", "<localleader>m", ":Emodel<cr>", "model" },
	{ "n", "<localleader>v", ":Eview<cr>", "view" },
	{ "n", "<localleader>c", ":Econtroller<cr>", "controller" },
	{ "n", "<localleader>r", ":e config/routes.rb<cr>", "routes" },
}

Helper.map {
	API        = "https://api.rubyonrails.org/",
	CHEATSHEET = "https://dev.to/ericchapman/my-beloved-ruby-cheat-sheet-208o",
	DOCSEARCH  = "https://devdocs.io/#q=ruby%20",
}

set.hlsearch = false
setlocal.foldcolumn = "0"

Laser.start {
	name = "Solargraph",
	cmd = { "solargraph", "stdio" },
	init_options = {
		formatting = true
	},
	settings = {
		solargraph = {
			diagnostics = true
		}
	},
}

-- local function rspec()
-- 	vim.fn.system('docker-compose exec app bundle exec rspec --require='..vim.fn.stdpath('config')..'/bridges/VIM_formatter.rb --format VimFormatter --out /tmp/quickfix.out  --format progress spec/domains')
-- 	vim.cmd.cgetfile('/tmp/quickfix.out')
-- 	vim.cmd.cwindow()
-- end

nnoremap_buffer('<M-s>', ':cgetfile tmp/quickfix.out | cwindow | cfirst<cr>')

-- Run the specs, and open the updated quickfix on `<leader>s`
-- :map <leader>s :call system('rspec --require=support/formatters/VIM_formatter.rb --format VimFormatter --out quickfix.out  --format progress') \| cg quickfix.out \| cwindow

-- or, without the temp file:
-- :map <leader>s :cgete system('rspec --require=support/formatters/vim_formatter.rb --format VimFormatter') \| cwindow

Plugin {
	-- "https://github.com/vim-ruby/vim-ruby",
	"https://github.com/tpope/vim-rails",
	"https://github.com/tpope/vim-bundler",
	"https://github.com/tpope/vim-dispatch",
}

