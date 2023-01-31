local telescope = require "telescope"

telescope.setup { extensions = { commander = {

	-- Diagnostics ------------------------------------------------------------
	{ "Show diagnostics",            vim.diagnostic.show },
	{ "Hide diagnostics",            vim.diagnostic.hide },

	{ "Update plugins",              Perun.update },
	{ "Update plugins (debug)",      Perun.debug_update },

	{ "Stop language server",        LaSerPro.stop },
	{ "Restart language server",     LaSerPro.restart },
	{ "LSP logs",                    LaSerPro.logs },

	{ "Edit filetype snippets",      "UltiSnipsEdit" },
	{ "Edit all snippets",           "UltiSnipsEdit!all" },

	{ "Enable Treesitter highlight", "TSBufEnable highlight" },
	{ "Disable Treesitter highlight","TSBufDisable highlight" },

	{ "Environmental variables",     "Telescope env"},

	{ "New tab",                     "tabnew" },

	{ "Remove trailing spaces",      "%s/\\s\\+$//e"},
	{ "Reverse all lines",           "g/^/m0" },
	{ "Print file",                  "hardcopy" },
	{ "Convert to HTML",             "TOhtml" },
	{ "Convert to PDF",              "hardcopy > %.ps | !ps2pdf %.ps && rm %.ps" },

	{ "Commit with current date",    '!git add .; git commit -m "$(date +\\%F)"' },
	{ "Git push",                    "!git push" },


	-- Telescope --------------------------------------------------------------
	{ "User commands",               "" },

	-- Yanka ------------------------------------------------------------------
	{ "Yank filename",               Yanka.filename },
	{ "Yank relative path",          Yanka.relative_path },
	{ "Yank full path",              Yanka.full_path },
	{ "Yank full dir",               Yanka.full_dir },
	{ "Yank <cfile>",                Yanka.cfile },


	-- { "Highlight trailing spaces", ""},
	-- { "Rsync",   Rsync },
	-- { "Toggle background",         Colorozor.toggle_background },

} } }

telescope.load_extension("commander")
nnoremap("<A-x>", ":Telescope commander<cr>", "commander")

