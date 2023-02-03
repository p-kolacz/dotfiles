-- Markdown
let.markdown_fenced_languages = { 'gdscript', 'html', 'css', 'php', 'sh', 'vim' }
vim.cmd[[hi markdownH1 gui=bold,underline]]
vim.cmd[[hi markdownH2 gui=bold,undercurl]]

Plugin {
	-- CSV
	"https://github.com/mechatroner/rainbow_csv",

	-- OrgMode
	"https://github.com/nvim-orgmode/orgmode",

	-- Ruby
	-- "https://github.com/vim-ruby/vim-ruby",
	"https://github.com/tpope/vim-rails",
	"https://github.com/tpope/vim-bundler",
	"https://github.com/tpope/vim-dispatch",

	-- Recfiles
	"https://github.com/zaid/vim-rec",

	-- SXHKD
	"https://github.com/kovetskiy/sxhkd-vim",
}

require"lib/lua-live-tests"
