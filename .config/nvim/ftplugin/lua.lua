setlocal.formatoptions:remove("o")

BufferNoremap {
	"n", "<localleader>x",  ":call luaeval(getline('.'))<cr>",  "evaluate line in nvim",
	"n", "<localleader>s",  ":w<cr>:luafile %<cr>",             "evaluate file in nvim",
	"n", "<localleader>r",  ":w<cr>:!lua %<cr>",                "run file",
}

Helper.map {
	MANUAL     = "https://www.lua.org/pil/contents.html",
	API        = "https://www.lua.org/manual/5.1/#index",
	CHEATSHEET = "https://cheatography.com/srgmc/cheat-sheets/lua-scripting-5-1/",
	STYLEGUIDE = "https://github.com/luarocks/lua-style-guide",
	DOCSEARCH  = "https://devdocs.io/#q=lua%20",
}

Laser.start {
	cmd = { "lua-language-server" },
}
