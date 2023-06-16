Cmdr.add {

	-- Diagnostics ------------------------------------------------------------
	{ "  Show diagnostics",            vim.diagnostic.show },
	{ "  Hide diagnostics",            vim.diagnostic.hide },

	-- Edit -------------------------------------------------------------------
	{ "  Remove trailing spaces",      "%s/\\s\\+$//e"},
	{ "  Reverse all lines",           "g/^/m0" },
	-- https://vi.stackexchange.com/questions/2299/how-to-translate-unicode-escape-sequences-to-the-unicode-character
	{ "  Unicode chars from \\uXXXX",  [[%s/\\\(\x\+\)/\=nr2char('0x'.submatch(1),1)/g]] },

	-- Git --------------------------------------------------------------------
	{ "  Commit with current date",    '!git add .; git commit -m "$(date +\\%F)"' },
	{ "  Git push",                    "!git push" },

	-- Plugins ----------------------------------------------------------------
	{ "  Update plugins",              Pluger.update },
	{ "  Update plugins (debug)",      Pluger.debug_update },

	-- Printing ---------------------------------------------------------------
	{ "  Print file",                  "hardcopy" },
	{ "  Convert to HTML",             "TOhtml" },
	{ "  Convert to PDF",              "hardcopy > %.ps | !ps2pdf %.ps && rm %.ps" },

	-- Files&Tabs -------------------------------------------------------------
	{ "  New file",                    "new" },
	{ "  New tab",                     "tabnew" },

	-- Windows ----------------------------------------------------------------
	{ "  Open quickfix",               "copen" },
	{ "  Close quickfix",              "cclose" },

	-- Yanka ------------------------------------------------------------------
	{ "  Yank filename",               Yanka.filename },
	{ "  Yank relative path",          Yanka.relative_path },
	{ "  Yank full path",              Yanka.full_path },
	{ "  Yank full dir",               Yanka.full_dir },
	{ "  Yank <cfile>",                Yanka.cfile },
	{ "  Yank buffer content",         Yanka.buffer },
	{ "  Yank set clipboard",          Yanka.set_clipboard },
	{ "  Yank unset clipboard",        Yanka.unset_clipboard },

	-- Zorya ------------------------------------------------------------------
	{ "  Toggle background",           Zorya.toggle_background },
}

