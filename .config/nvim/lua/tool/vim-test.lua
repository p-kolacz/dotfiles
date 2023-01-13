Plugin "https://github.com/tpope/vim-dispatch"
Plugin "https://github.com/vim-test/vim-test"

let['test#strategy'] = "make"

-- vim.g["test#ruby#rspec#executable"] = "docker-compose exec app bundle exec bin/rspec"

mapgroup("<leader>t", "+Tests")
nnoremap("<leader>tn", ":TestNearest<cr>", "nearest")
nnoremap("<leader>tt", ":TestFile<cr>", "file")

