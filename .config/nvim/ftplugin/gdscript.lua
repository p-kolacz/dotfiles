-- setlocal.formatoptions("t")

-- nnoremap_buffer("<C-space>", ":Telescope find_files find_command=rg,--hidden,--no-ignore,-i,--files,--glob,*gd,--glob,*shader,--glob,*json,--glob,*csv<cr>")
nnoremap_buffer("<F5>", ":wa<cr>:GodotRun<CR>")
nnoremap_buffer("<F6>", ":wa<cr>:GodotRunCurrent<CR>")

Help.map(Help.Type.MANUAL, "https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_basics.html")
Help.map(Help.Type.API, "https://docs.godotengine.org/en/stable/classes/index.html")
Help.map(Help.Type.STYLEGUIDE, "https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html?highlight=style")
Help.map(Help.Type.CUSTOM1, "https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_format_string.html#format-specifiers", "string format")
Help.map(Help.Type.CUSTOM2, "https://docs.godotengine.org/en/stable/tutorials/gui/bbcode_in_richtextlabel.html", "BBCode")

