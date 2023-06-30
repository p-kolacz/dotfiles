let.mapleader = " "
let.maplocalleader = "\\"

local _ = "" local i = "i" local n = "n" local v = "v" local c = "c" local x = "x" local G = "G"
Mapper.map {
	---------------------------------- Buffer ----------------------------------
	n,	"<leader>w",   ":w<CR>",			               nil,
	----------------------------------- Code -----------------------------------
	G,	"<leader>c",   "+Code",                            "",
	------------------------------- Command Mode -------------------------------
	n,  "<leader><leader>", ":",                           "command mode",
	c,  "<C-a>",       "<home>",                           "",
	c,  "<A-f>",       "<S-right>",                        "",
	c,  "<C-b>",       "<left>",                           "",
	c,  "<A-b>",       "<S-left>",                         "",
	----------------------------------- Diff -----------------------------------
	G,  "<leader>d",   "+Diff",                            "",
	n,  "<leader>dd",  ":diffthis<cr>",                    "diff this",
	n,  "<leader>do",  ":diffoff!<cr>",                    "diff off",
	----------------------------------- Edit -----------------------------------
	i,  "<C-a>",       "<home>",                           "",
	i,  "<C-b>",       "<left>",                           "",
	i,  "<C-e>",       "<end>",                            "",
	i,  "<C-d>",       "<delete>",                         "",
	i,  "<C-f>",       "<right>",                          "",
	i,  "<A-f>",       "<s-right>",                        "",
	i,  "<A-b>",       "<s-left>",                         "",

	n,  "<A-j>",       ":m .+1<cr>==",                     "move line",
	n,  "<A-k>",       ":m .-2<cr>==",                     "",
	v,  "<A-j>",       ":m '>+1<cr>gv=gv",                 "move selection",
	v,  "<A-k>",       ":m '<-2<cr>gv=gv",                 "",

	G,  "<leader>e",   "+Edit",                            "",
	-- n,  "<leader>et",  ":%s/\\s\\+$//e<CR>",               "remove trailing spaces",
	n,  "<leader>es",  ":%s/",                             "substitute",
	v,  "<leader>es",  ":s/",                              "substitute",
	-- n,  "<leader>er",  ":g/^/m0<CR>",                      "reverse lines",
	v,  "<leader>er",  ":'<,'>!tac<CR>",                   "reverse lines",
	-- change cword and press . to repeat change on next, n to goto next
	n,  "<leader>ed",  ":let @/='\\<'.expand('<cword>').'\\>'<cr>cgn", "change&repeat",
	x,  "<leader>ed",  "\"sy:let @/=@s<cr>cgn",            "",
	----------------------------------- File -----------------------------------
	G,  "<leader>f",   "+File", "",
	n,  "<leader>fd",  ":e <C-R>=expand('%:p:h').'/'<CR>", "current file dir",
	n,  "<leader>fn",  ":new<cr>",                         "new file",
	n,  "<leader>fx",  ":silent !chmod +x %<cr>:e<cr>",    "chmod +x",

	------------------------------------ Git -----------------------------------
	G,  "<leader>g",  "+Git", "",
	n,  "<leader>gg",  ":silent !$TERMINAL lazygit &<cr>", "LazyGit",
	-- G,  "<leader>gc",  "+Commit", "",

	----------------------------------- Help -----------------------------------
	G,  "<leader>h",   "+Help",                            "",
	n,  "gy",          Helper.search_this,                  "online search cword",
	v,  "gy",          Helper.search_this,              "online search selection",
	n,  "<leader>hn",  Helper.edit_ft_notes,                 "filetype notes",

	---------------------------------- Insert ----------------------------------
	G,  "<leader>i",   "+Insert",                           "",
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
	n,  "<leader>oh",  ":setlocal hlsearch!<CR>",            "toggle higlight search",
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
	G,  "<leader>t",   "+Tabs",             "",
	n,  "<leader>tt",  ":tabnew<cr>",       "new tab",
	n,  "<leader>tc",  ":tabclose<cr>",     "close tab",
	n,  "<leader>1",   "1gt",               "tab 1",
	n,  "<leader>2",   "2gt",               "tab 2",
	n,  "<leader>3",   "3gt",               "tab 3",
	-- n,  "<leader>4",  "4gt", "tab 4",
	-- n,  "<leader>5",  "5gt", "tab 5",
	------------------------------------ Vim -----------------------------------
	G,  "<leader>v",  "+Vim", "",
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

