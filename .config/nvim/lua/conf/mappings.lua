let.mapleader = " "
let.maplocalleader = "\\"

----------------------------------- Code -----------------------------------
mapgroup("<leader>c", "+Code")
mapgroup("<leader>e", "+Edit")
vnoremap("/", "<ESC>/\\%V")
local i = "i" local n = "n" local v = "v" local c = "c"
mapall {
--------------------------------- Navigation -------------------------------
	i,  "jj",    "<ESC>", "",
	i,  "kk",    "<ESC>", "",
	i,  "jk",    "<ESC>", "",
	n,  "H",     "^", "",
	v,  "H",     "^", "",
	v,  "L",     "$", "",
	n,  "L",     "$", "",
	n,  "[q",    ":cprevious<cr>", "next quickfix entry",
	n,  "]q",    ":cnext<cr>",     "previous quickfix entry",
	n,  "[l",    ":lprevious<cr>", "next loclist entry",
	n,  "]l",    ":lnext<cr>",     "previous loclist entry",
	n,  "<F12>", ":execute 'e' stdpath('config').'/init.lua'<CR>", "",
	n,  "<F11>", ":execute 'e' stdpath('config').'/ftplugin/'.&filetype.'.lua'<cr>", "",

---------------------------------- Buffer ----------------------------------
	n,  "<leader>w",   ":w<CR>",    "which_key_ignore",

--------------------------------- Command Mode --------------------------------
	c,  "<C-a>",       "<home>",    "",
	c,  "<A-f>",       "<S-right>", "",
	c,  "<C-b>",       "<left>",    "",
	c,  "<A-b>",       "<S-left>",  "",

----------------------------------- Edit -----------------------------------
	i,  "<C-f>",       "<right>",            "",
	i,  "<A-f>",       "<s-right>",          "",
	i,  "<C-b>",       "<left>",             "",
	i,  "<A-b>",       "<s-left>",           "",
	v,  "<C-c>",       '"*y :let @+=@*<CR>', "",
	n,  "<A-j>",       ":m .+1<cr>==",       "", -- Move line
	n,  "<A-k>",       ":m .-2<cr>==",       "",
	v,  "<A-j>",       ":m '>+1<cr>gv=gv",   "", -- Move selection
	v,  "<A-k>",       ":m '<-2<cr>gv=gv",   "",
	n,  "<leader>et",  ":%s/\\s\\+$//e<CR>", "remove trailing spaces",
	n,  "<leader>es" , ":%s/",               "substitute",
	v,  "<leader>es" , ":s/",                "substitute",
}


-- Clipboard
map("<C-v>", '"+P')

-- change cword and press . to repeat change on next, n to goto next
nnoremap("<leader>ed", ":let @/='\\<'.expand('<cword>').'\\>'<cr>cgn", "change&repeat")
xnoremap("<leader>ed", "\"sy:let @/=@s<cr>cgn")

nnoremap("<leader>er", ":g/^/m0<CR>", "reverse lines")
vnoremap("<leader>er", ":'<,'>!tac<CR>", "reverse lines")

nmap('<leader>"', 'ysiw"', '"cword"')
nmap("<leader>'", "ysiw'", "'cword'")

----------------------------------- File -----------------------------------
mapgroup("<leader>f", "+File")
nnoremap("<leader>fx", ":silent !chmod +x %<cr>", "chmod +x")

------------------------------------ Git -----------------------------------
mapgroup("<leader>g", "+Git")
nnoremap("<leader>gg", ":silent !$TERMINAL lazygit &<cr>", "LazyGit")
mapgroup("<leader>gc", "+Commit")
nnoremap("<leader>gcc", ':!git add . && git commit -m ', "commit")
nnoremap("<leader>gcd", ':!git add . && git commit -m "$(date +\\%F)"<cr>', "with current date")
-- mapgroup("<leader>gp", '+Push')
-- nnoremap("<leader>gpp", ':!git push<cr>', "push")
-- nnoremap("<leader>gpd", ':!git add . && git commit -m "$(date +\\%F)" && git push<cr>', "with current date")

----------------------------------- Help -----------------------------------
nnoremap("gy", [[:silent execute "!xdg-open 'https://www.startpage.com/sp/search?query=" . expand("<cword>") . "'"<cr>]], "online search cword")
vnoremap("gy", [[y:silent execute "!xdg-open 'https://www.startpage.com/sp/search?query=" . expand("<C-r>0") . "'"<cr>]], "online search selection")
mapgroup("<leader>h", "+Help")
nnoremap("<leader>hn", Help.edit_ft_notes, 'filetype notes')

---------------------------------- Insert ----------------------------------
mapgroup("<leader>i", "+Insert")

---------------------------------- Options ---------------------------------
mapgroup("<leader>o", "+Options")
nnoremap("<leader>ol", ":setlocal list!<CR>", 'toggle invisible chars')
nnoremap("<leader>on", ":set number!<CR>", 'toggle line numbers')
nnoremap("<leader>or", ":set relativenumber!<CR>", 'toggle relative numbers')
nnoremap("<leader>ow", ":setlocal wrap!<CR>", 'toggle wrap')

---------------------------------- Project ---------------------------------
-- https://vi.stackexchange.com/questions/2776/vim-search-replace-all-files-in-current-project-folder
vim.cmd('command! -nargs=1 ProjGrep :vimgrep /<args>/gj ** | copen')
vim.cmd('command! -nargs=1 ProjSubstitute :cfdo %s/<args>/gc | update')
mapgroup('<leader>p', '+Project')
nnoremap('<leader>pg', ':ProjGrep<space>', 'grep')
nnoremap('<leader>ps', ':ProjSubstitute<space>', 'substitute')
nnoremap('<leader>pt', ':vimgrep /TODO:/j ** | copen<cr>', 'TODOs')

----------------------------------- Spell ----------------------------------
mapgroup("<leader>s", "+Spell")
nnoremap("<leader>ss", ":setlocal spell!<CR>", "spell check")
nnoremap("<leader>sc", ":setlocal complete+=kspell<CR>", 'spell complete')
nnoremap("<leader>sn", ":setlocal complete-=kspell<CR>", 'spell no complete')
nnoremap("<leader>se", ":setlocal spelllang=en_us<CR>", 'lang en_us')
nnoremap("<leader>sp", ":setlocal spelllang=pl<CR>", 'lang pl')

------------------------------------- Tabs ---------------------------------
-- nnoremap("<c-t>", ":tabnew<cr>")
nnoremap("<c-tab>", ":tabnext<cr>")
nnoremap("<c-s-tab>", ":tabprevious<cr>")
nnoremap("<leader>1", "1gt", "tab 1")
nnoremap("<leader>2", "2gt", "tab 2")
nnoremap("<leader>3", "3gt", "tab 3")
nnoremap("<leader>4", "4gt", "tab 4")
nnoremap("<leader>5", "5gt", "tab 5")


----------------------------------- Tools ----------------------------------
mapgroup("<leader>t", "+Tools")
-- nnoremap("gi", ":OpenImg<CR>", "open image")
-- https://vi.stackexchange.com/questions/2299/how-to-translate-unicode-escape-sequences-to-the-unicode-character
nnoremap("<leader>tu", [[:%s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g<cr>]], 'unicode chars from \\uXXXX')

------------------------------------ Vim -----------------------------------
mapgroup("<leader>v", "+Vim")
nnoremap("<leader>vg", function ()
	vim.o.background = vim.o.background == "light" and "dark" or "light"
end, "toggle background")

---------------------------------- Windows ---------------------------------
nnoremap("<leader>q", ":q<CR>", "")
nnoremap("<C-h>", "<C-w>h", "left window")
nnoremap("<C-j>", "<C-w>j", "bottom window")
nnoremap("<C-k>", "<C-w>k", "up window")
nnoremap("<C-l>", "<C-w>l", "right window")

nnoremap("<C-A-h>", "<C-w>h<C-w>|", "left window")
nnoremap("<C-A-j>", "<C-w>j<C-w>_", "bottom window")
nnoremap("<C-A-k>", "<C-w>k<C-w>_", "up window")
nnoremap("<C-A-l>", "<C-w>l<C-w>|", "right window")

-- nnoremap("<a-h>", "<C-w><", "resize window")
-- nnoremap("<a-l>", "<C-w>>", "resize window")

