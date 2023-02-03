-- setlocal.formatoptions("t")

-- nnoremap_buffer("<C-space>", ":Telescope find_files find_command=rg,--hidden,--no-ignore,-i,--files,--glob,*gd,--glob,*shader,--glob,*json,--glob,*csv<cr>")
nnoremap_buffer("<F5>", ":wa<cr>:GodotRun<CR>")
nnoremap_buffer("<F6>", ":wa<cr>:GodotRunCurrent<CR>")

Helper.setup {
	MANUAL     = "https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_basics.html",
	API        = "https://docs.godotengine.org/en/stable/classes/index.html",
	STYLEGUIDE = "https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html?highlight=style",
	CUSTOM1    = "https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_format_string.html#format-specifiers", -- "string format",
	CUSTOM2    = "https://docs.godotengine.org/en/stable/tutorials/gui/bbcode_in_richtextlabel.html", -- "BBCode",
}

Laser.start {
	name = "GodotLS",
	cmd = {"nc", "localhost", "6008"},
}

