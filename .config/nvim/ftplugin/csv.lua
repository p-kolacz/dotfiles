nnoremap_buffer("<localleader>a", ":%!column -t<CR>", "tabelarize")
nnoremap_buffer("<localleader>j", ':!csv2json.sh "%" > "%:t:r".json<CR>', "2 json")

