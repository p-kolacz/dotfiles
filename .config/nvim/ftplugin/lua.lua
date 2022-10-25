setlocal.formatoptions:remove("o")

nnoremap_buffer("<localleader>x", ":call luaeval(getline('.'))<cr>", "evaluate line")
nnoremap_buffer("<localleader>s", ":w<cr>:luafile %<cr>", "evaluate file")

Help.map(Help.Type.MANUAL,     "https://www.lua.org/manual/5.1/")
Help.map(Help.Type.API,        "https://www.lua.org/manual/5.1/#index")
Help.map(Help.Type.CHEATSHEET, "https://cheatography.com/srgmc/cheat-sheets/lua-scripting-5-1/")
Help.map(Help.Type.STYLEGUIDE, "https://github.com/luarocks/lua-style-guide")

