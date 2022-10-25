setlocal.foldenable = false

Help.map(Help.Type.MANUAL, "https://www.gnu.org/software/recutils/manual/")
Help.map(Help.Type.API, "https://www.gnu.org/software/recutils/manual/Concept-Index.html#Concept-Index")

nnoremap_buffer("<localleader>b", ":silent !xdg-open 'https://brickset.com/search?query=<c-r>=expand(\"<cword>\")<cr>&scope=All'<cr>", "brickset")
nnoremap_buffer("<localleader>ms", ":silent !xdg-open 'https://www.blue-ocean-ag.com/fileadmin/Bauanleitungen/LEGO_Star_Wars/<c-r>=expand(\"<cword>\")<cr>_LEGO-Star_Wars.pdf'<cr>", "manual Star Wars")
nnoremap_buffer("<localleader>mb", ":silent !xdg-open 'https://www.blue-ocean-ag.com/fileadmin/Bauanleitungen/LEGO_BATMAN/<c-r>=expand(\"<cword>\")<cr>_LEGO-Batman.pdf'<cr>", "manual Batman")
nnoremap_buffer("<localleader>ma", ":silent !xdg-open 'https://www.blue-ocean-ag.com/fileadmin/Bauanleitungen/LEGO_Marvel_Avengers/<c-r>=expand(\"<cword>\")<cr>_LEGO-Avengers.pdf'<cr>", "manual Avengers")

