require'lib/caniuse'.setup()

mapgroup("<leader>hu", "+Can I Use")
nnoremap_buffer('<leader>huc', ':CaniuseCword<cr>', 'caniuse cword')
nnoremap_buffer('<leader>huq', ':Caniuse ', 'caniuse query')

Help.map(Help.Type.CHEATSHEET, "https://devhints.io/css")
Help.map(Help.Type.CUSTOM1, "https://devhints.io/css-flexbox")

