Cmdr.add {

	-- Diagnostics ------------------------------------------------------------
	{ "Show diagnostics",            vim.diagnostic.show },
	{ "Hide diagnostics",            vim.diagnostic.hide },

	-- Edit -------------------------------------------------------------------
	{ "Remove trailing spaces",      "%s/\\s\\+$//e"},
	{ "🔃Reverse all lines",           "g/^/m0" },

	-- Git --------------------------------------------------------------------
	{ " Commit with current date",    '!git add .; git commit -m "$(date +\\%F)"' },
	{ " Git push",                    "!git push" },

	-- Plugins ----------------------------------------------------------------
	{ "Update plugins",              Plugger.update },
	{ "Update plugins (debug)",      Plugger.debug_update },

	-- Printing ---------------------------------------------------------------
	{ "🖨Print file",                  "hardcopy" },
	{ "Convert to HTML",             "TOhtml" },
	{ "Convert to PDF",              "hardcopy > %.ps | !ps2pdf %.ps && rm %.ps" },

	-- Tabs -------------------------------------------------------------------
	{ "裡New tab",                     "tabnew" },

	-- Windows ----------------------------------------------------------------
	{ "✏️ Open quickfix",               "copen" },
	{ "✏️ Close quickfix",              "cclose" },

	-- Yanka ------------------------------------------------------------------
	{ "Yank filename",               Yanka.filename },
	{ "Yank relative path",          Yanka.relative_path },
	{ "Yank full path",              Yanka.full_path },
	{ "Yank full dir",               Yanka.full_dir },
	{ "Yank <cfile>",                Yanka.cfile },

	-- Zorya ------------------------------------------------------------------
	{ "Toggle background",           Zorya.toggle_background },
}

