Plugin "https://github.com/vim-test/vim-test"

-- vim.opt['test#strategy'] = "neovim"

mapgroup("<leader>t", "+Tests")
nnoremap("<leader>tn", ":TestNearest<cr>", "nearest")
nnoremap("<leader>tt", ":TestFile<cr>", "file")

