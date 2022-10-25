setlocal.foldmethod = "indent"

require'lib/caniuse'.setup()
mapgroup("<leader>hu","Can I Use")
nnoremap_buffer('<leader>huc', ':CaniuseCword<cr>', 'caniuse cword')
nnoremap_buffer('<leader>huq', ':Caniuse ', 'caniuse query')

nnoremap("<localleader>l", ":!livereload -p 8000 &<cr>", "livereload server")

