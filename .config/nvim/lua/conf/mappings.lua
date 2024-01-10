local _ = "" local i = "i" local n = "n" local v = "v" local c = "c" local x = "x" local G = "G"
Mapper.map {
	------------------------------- Command Mode -------------------------------
	----------------------------------- Diff -----------------------------------
	G,  "<leader>d",   "+Diff",                            "",
	n,  "<leader>dd",  ":diffthis<cr>",                    "diff this",
	n,  "<leader>do",  ":diffoff!<cr>",                    "diff off",

	----------------------------------- Help -----------------------------------
	G,  "<leader>h",   "+Help",                            "",
	n,  "gy",          Helper.search_this,                 "online search cword",
	v,  "gy",          Helper.search_this,                 "online search selection",
	n,  "<leader>hn",  Helper.edit_ft_notes,               "filetype notes",

	----------------------------------- Jump -----------------------------------
	G,  "<leader>j",   "+Jump",                             "",
	--------------------------------- Navigation -------------------------------
	i,  "jj",          "<ESC>",                            "",
	i,  "kk",          "<ESC>",                            "",
	i,  "jk",          "<ESC>",                            "",
	n,  "H",           "^",                                "",
	v,  "H",           "^",                                "",
	v,  "L",           "$",                                "",
	n,  "L",           "$",                                "",
	n,  "[q",          ":cprevious<cr>",                   "next quickfix entry",
	n,  "]q",          ":cnext<cr>",                       "previous quickfix entry",
	n,  "[l",          ":lprevious<cr>",                   "next loclist entry",
	n,  "]l",          ":lnext<cr>",                       "previous loclist entry",
	n,  "<F12>",       ":execute 'e' stdpath('config').'/init.lua'<CR>", "",
	n,  "<F11>",       ":execute 'e' stdpath('config').'/ftplugin/'.&filetype.'.lua'<cr>", "",

	---------------------------------- Options ---------------------------------
	G,  "<leader>o",   "+Options",  "",
	n,  "<leader>oh",  ":set hlsearch!<CR>",            "toggle higlight search",
	n,  "<leader>ol",  ":setlocal list!<CR>",            "toggle invisible chars",
	n,  "<leader>on",  ":set number!<CR>",          "toggle line numbers",
	n,  "<leader>or",  ":set relativenumber!<CR>",  "toggle relative numbers",
	n,  "<leader>ow",  ":setlocal wrap!<CR>",            "toggle wrap",
	----------------------------------- Search ---------------------------------
	v,  "/",  "<ESC>/\\%V", "",
	----------------------------------- Spell ----------------------------------
	G,  "<leader>s",   "+Spell", "",
	n,  "<leader>ss",  ":setlocal spell!<CR>",             "spell check",
	n,  "<leader>sc",  ":setlocal complete+=kspell<CR>",   "spell complete",
	n,  "<leader>sn",  ":setlocal complete-=kspell<CR>",   "spell no complete",
	n,  "<leader>se",  ":setlocal spelllang=en_us<CR>",    "lang en_us",
	n,  "<leader>sp",  ":setlocal spelllang=pl<CR>",       "lang pl",
	------------------------------------- Tabs ---------------------------------
	-- nnoremap("<c-t>", ":tabnew<cr>")
	-- n,  "<c-tab>",  ":tabnext<cr>", "",
	-- n,  "<c-s-tab>",  ":tabprevious<cr>", "",
	---------------------------------- Windows ---------------------------------
	n,  "<leader>q",  ":q<CR>", "quit",
	n,  "<C-h>",  "<C-w>h", "left window",
	n,  "<C-j>",  "<C-w>j", "bottom window",
	n,  "<C-k>",  "<C-w>k", "up window",
	n,  "<C-l>",  "<C-w>l", "right window",
	n,  "<C-A-h>",  "<C-w>h<C-w>|", "left window",
	n,  "<C-A-j>",  "<C-w>j<C-w>_", "bottom window",
	n,  "<C-A-k>",  "<C-w>k<C-w>_", "up window",
	n,  "<C-A-l>",  "<C-w>l<C-w>|", "right window",
	----------------------------------- Yank -----------------------------------
	v,  "<C-c>",       '"*y :let @+=@*<CR>',               "",
	_,  "<C-v>",       '"+P',                              "",
}

nmap('<leader>"', 'ysiW"', '"cWord"')
nmap("<leader>'", "ysiW'", "'cWord'")

nmap("<leader>e'",  [[cs"']], "change surrounding to '")
nmap('<leader>e"',  [[cs'"]], 'change surrounding to "')

