let.mapleader = " "
let.maplocalleader = "\\"

local _ = "" local i = "i" local n = "n" local v = "v" local c = "c" local x = "x" local G = "G"
require "lib/mapper" {
	---------------------------------- Buffer ----------------------------------
	n,	"<leader>w",   ":w<CR>",			               "",
	----------------------------------- Code -----------------------------------
	G,	"<leader>c",   "+Code",                            "",
	------------------------------- Command Mode -------------------------------
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
	n,  "<leader>et",  ":%s/\\s\\+$//e<CR>",               "remove trailing spaces",
	n,  "<leader>es",  ":%s/",                             "substitute",
	v,  "<leader>es",  ":s/",                              "substitute",
	n,  "<leader>er",  ":g/^/m0<CR>",                      "reverse lines",
	v,  "<leader>er",  ":'<,'>!tac<CR>",                   "reverse lines",
	-- change cword and press . to repeat change on next, n to goto next
	n,  "<leader>ed",  ":let @/='\\<'.expand('<cword>').'\\>'<cr>cgn", "change&repeat",
	x,  "<leader>ed",  "\"sy:let @/=@s<cr>cgn",            "",
	----------------------------------- File -----------------------------------
	G,  "<leader>f",   "+File", "",
	n,  "<leader>fn",  ":new<cr>",                         "new file",
	n,  "<leader>fp",  ":hardcopy",                        "print file",
	n,  "<leader>fx",  ":silent !chmod +x %<cr>:e<cr>",    "chmod +x",
	G,  "<leader>ft",  "+Convert",                         "",
	n,  "<leader>fth", ":TOhtml<cr>",                      "to HTML",
	n,  "<leader>ftp", ":hardcopy > %.ps | !ps2pdf %.ps && rm %.ps<cr>",        "to PDF",
	------------------------------------ Git -----------------------------------
	G,  "<leader>g",  "+Git", "",
	n,  "<leader>gg",  ":silent !$TERMINAL lazygit &<cr>", "LazyGit",
	G,  "<leader>gc",  "+Commit", "",
	n,  "<leader>gcc",  ':!git add .; git commit -m ',     "commit",
	n,  "<leader>gcd",  ':!git add .; git commit -m "$(date +\\%F)"<cr>', "with current date",
	G,  "<leader>gp",  '+Push', "",
	n,  "<leader>gpp",  ':!git push<cr>', "push",
	n,  "<leader>gpd",  ':!git add .; git commit -m "$(date +\\%F)"; git push<cr>', "with current date",
	----------------------------------- Help -----------------------------------
	G,  "<leader>h",   "+Help",                            "",
	n,  "gy",          Help.search_cword,                  "online search cword",
	v,  "gy",          Help.search_selection,              "online search selection",
	n,  "<leader>hn",  Help.edit_ft_notes,                 "filetype notes",

	---------------------------------- Insert ----------------------------------
	G,  "<leader>i",   "+Insert",                           "",
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
	n,  "<leader>ol",  ":setlocal list!<CR>",            "toggle invisible chars",
	n,  "<leader>on",  ":set number!<CR>",          "toggle line numbers",
	n,  "<leader>or",  ":set relativenumber!<CR>",  "toggle relative numbers",
	n,  "<leader>ow",  ":setlocal wrap!<CR>",            "toggle wrap",
	----------------------------------- Search ---------------------------------
	v,  "/",  "<ESC>/\\%V", "",
	----------------------------------- Spell ----------------------------------
	G,  "<leader>s",  "+Spell", "",
	n,  "<leader>ss",  ":setlocal spell!<CR>",             "spell check",
	n,  "<leader>sc",  ":setlocal complete+=kspell<CR>",   "spell complete",
	n,  "<leader>sn",  ":setlocal complete-=kspell<CR>",   "spell no complete",
	n,  "<leader>se",  ":setlocal spelllang=en_us<CR>",    "lang en_us",
	n,  "<leader>sp",  ":setlocal spelllang=pl<CR>",       "lang pl",
	------------------------------------- Tabs ---------------------------------
	-- nnoremap("<c-t>", ":tabnew<cr>")
	n,  "<c-tab>",  ":tabnext<cr>", "",
	n,  "<c-s-tab>",  ":tabprevious<cr>", "",
	n,  "<leader>1",  "1gt", "tab 1",
	n,  "<leader>2",  "2gt", "tab 2",
	n,  "<leader>3",  "3gt", "tab 3",
	n,  "<leader>4",  "4gt", "tab 4",
	n,  "<leader>5",  "5gt", "",
	------------------------------------ Vim -----------------------------------
	G,  "<leader>v",  "+Vim", "",
	---------------------------------- Windows ---------------------------------
	n,  "<leader>q",  ":q<CR>", "which_key_ignore",
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
	G,  "<leader>y",   "+Yank",                            "",
	n,  "<leader>yf",  Yanka.filename,        "filename",
	n,  "<leader>yr",  Yanka.relative_path,   "relative path",
	n,  "<leader>yp",  Yanka.full_path,       "full path",
	n,  "<leader>yd",  Yanka.full_dir,        "full dir",
	n,  "<leader>yc",  Yanka.cfile,           "file under cursor",
}

nmap('<leader>"', 'ysiW"', '"cWord"')
nmap("<leader>'", "ysiW'", "'cWord'")

nnoremap("<leader>vg", function ()
	vim.o.background = vim.o.background == "light" and "dark" or "light"
end, "toggle background")

