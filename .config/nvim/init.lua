-- Bootstrap {{{

	Require = require "lib/bootstrap"
	Pluger = require "lib/plugozaur"
	Plugin = Pluger.plugin
	Icons  = require "lib/iconz"
	Perun = require "perun"
	Mapper = require "lib/mapper"
	Noremap = Mapper.add
	Helper = require "lib/helpozor"
	Laser  = require "lib/laserpro"

	Plugin "https://github.com/folke/which-key.nvim"
	WK = require("which-key")
	WK.setup {
		icons = Icons.whichkey,
		layout = {
			align = "center",
		},
		-- ignore_missing = true, -- wainting for merge
	}

	let.mapleader = " "
	let.maplocalleader = "\\"
	augroup("vimrc", { clear = true })

	autocmd("BufWinEnter", {
		group = "vimrc",
		pattern = { "*/.config/nvim/init.lua", "*/.config/nvim/lua/conf/appearance.lua" },
		command = "setlocal includeexpr=stdpath('config').'/lua/'.v:fname"
	})

	vim.cmd("command! -nargs=1 Rsync :!rsync -avz --filter=':- .gitignore' ./ <args>")

	Plugin "https://github.com/nvim-lua/plenary.nvim"

-- }}}
-- Appearance {{{

	vim.cmd.language("messages en_US.utf8")
	Set {
		listchars     = Icons.listchars,
		fillchars     = Icons.fillchars,
		cursorline    = true,
		wrap          = false,
		number        = true,
		scrolloff     = 5,
		sidescrolloff = 5,
		showmatch     = true,
		signcolumn    = "yes",
		splitbelow    = true,
		splitright    = true,
		termguicolors = true,
	}

	Icons.setup_devicons()
	Icons.setup_diagnostics()

	Plugin "https://github.com/RRethy/vim-illuminate"
	require "illuminate".configure {
		filetypes_allowlist = { "lua", "rails", "ruby", "sh", },
		min_count_to_highlight = 2,
	}
	Plugin "https://github.com/petertriho/nvim-scrollbar"
	require"scrollbar".setup { handlers = { cursor = false } }

	Plugin "https://github.com/lukas-reineke/indent-blankline.nvim"
	require("ibl").setup {
		indent = { char = " " },
		scope =  { char = "▎" },
	}

	Plugin "https://github.com/stevearc/dressing.nvim"

	vim.cmd.colorscheme("darkblue")

	Zorya  = require "zorya"
	Zorya.setup {
		restore_colorscheme = true,
		colorschemes = require "conf/themez",
	}
	Zorya.enable_highlight()

	-- Treesitter uses diffrent groups
	-- Zorya.highlight("markdownH1", "gui=bold,underline")
	-- Zorya.highlight("markdownH2", "gui=undercurl")

	Perun.add {
		{ "  Colorschemes",       Zorya.select_colorscheme },
		{ "  Toggle background",  Zorya.toggle_background  },
	}
-- }}}
-- Code {{{

	Require {
		"tool/completion",
		"tool/lsp",
		"tool/treesitter",
	}
	Plugin {
		"https://github.com/tpope/vim-commentary",
		"https://github.com/tpope/vim-surround",
		"https://github.com/tpope/vim-repeat",
	}
	Mapgroup("<leader>c", "+Code")
	Noremap {
		{ {"n","v"},  "<BS>",   ":Commentary<cr>" },
		{ "n", "<C-/>", ":Commentary<cr><down>" },
	}
	nmap("<leader>cc", "yypkgccj", 'duplicomment')
	Perun.add {
		{ "  Show diagnostics",            vim.diagnostic.show },
		{ "  Hide diagnostics",            vim.diagnostic.hide },
	}

-- }}}
-- Command Mode {{{

	Noremap {
		{ "n",  "<leader><leader>",  ":",         "command mode", },
		{ "c",  "<C-a>",             "<home>",                    },
		{ "c",  "<A-f>",             "<S-right>",                 },
		{ "c",  "<C-b>",             "<left>",                    },
		{ "c",  "<A-b>",             "<S-left>",                  },
	}

--}}}
-- Edit {{{

	Set {
		shiftwidth = 4,
		tabstop    = 4,
	}
	mapgroup("<leader>e", "+Edit")
	mapgroup("<leader>i", "+Insert")
	Noremap {
		{ "i",  "<C-a>",  "<home>",                                  },
		{ "i",  "<C-b>",  "<left>",                                  },
		{ "i",  "<C-e>",  "<end>",                                   },
		{ "i",  "<C-d>",  "<delete>",                                },
		{ "i",  "<C-f>",  "<right>",                                 },
		{ "i",  "<A-f>",  "<s-right>",                               },
		{ "i",  "<A-b>",  "<s-left>",                                },
		{ "n",  "<A-j>",  ":m .+1<cr>==",     "move line down"       },
		{ "n",  "<A-k>",  ":m .-2<cr>==",     "move line up"         },
		{ "v",  "<A-j>",  ":m '>+1<cr>gv=gv", "move selection down"  },
		{ "v",  "<A-k>",  ":m '<-2<cr>gv=gv", "move selection up"    },
		{ "n",  "<leader>es",  ":%s/",                             "substitute" },
		{ "v",  "<leader>es",  ":s/",                              "substitute" },
		{ "n",  "<leader>er",  ":g/^/m0<CR>",                      "reverse lines" },
		{ "v",  "<leader>er",  ":'<,'>!tac<CR>",                   "reverse lines" },
		-- change cword and press . to repeat change on next, n to goto next
		{ "n",  "<leader>ed",  ":let @/='\\<'.expand('<cword>').'\\>'<cr>cgn", "change&repeat" },
		{ "x",  "<leader>ed",  "\"sy:let @/=@s<cr>cgn",            "" },
		{ "n",	"<leader>w",   ":w<CR>",			               "write", }
	}
	Perun.add {
		{ "  Edit: Capitalize buffer",          [[%s/\<./\u&/g]]    },
		{ "  Edit: Capitalize line",            [[s/\<./\u&/g]]     },
		{ "  Edit: Remove trailing spaces",     "%s/\\s\\+$//e"     },
		{ "  Edit: Reverse all lines",          "g/^/m0"            },
		{ "  Edit: Unicode chars from \\uXXXX", [[%s/\\\(\x\+\)/\=nr2char('0x'.submatch(1),1)/g]] },
	}

	set.autowrite      = true
	set.mouse          = "a"
	mapgroup("<leader>f", "+File")
	Noremap {
		{ "n",  "<leader>fd",  ":e <C-R>=expand('%:p:h').'/'<CR>", "current file dir" },
		{ "n",  "<leader>fn",  ":new<cr>",                         "new file" },
		{ "n",  "<leader>fx",  ":silent !chmod +x %<cr>:e<cr>",    "chmod +x" },
	}

	autocmd("FocusLost", {
		group = "vimrc",
		pattern = "*",
		command = "wall",
	})

	-- Remeber foldings and stuff...
	set.viewoptions = "cursor,folds"
	autocmd("BufWinLeave", {
		group = "vimrc",
		pattern = "?*",			-- ?* ensures filename is not empty, for non-file buffers
		command = "mkview",
	})
	autocmd("BufWinEnter", {
		group = "vimrc",
		pattern = "?*",
		command = "silent! loadview",
	})

	-- }}}
-- Git {{{

	Plugin  "https://github.com/lewis6991/gitsigns.nvim"
	local gg = require "gitgud"

	mapgroup("<leader>g", "+Git")
	Noremap { "n",  "<leader>gg",  gg.lazygit, "LazyGit" }


	local gs = require "gitsigns"
	gs.setup{
		trouble = true,
		on_attach = function()

			nnoremap_buffer(']c', function()
				gg.gitsigns_next_hunk(gs)
			end, "next hunk", {expr=true})

			nnoremap_buffer('[c', function()
				gg.gitsigns_prev_hunk(gs)
			end, "prev hunk",  {expr=true})

			nnoremap_buffer("<leader>gb", gs.blame_line, "blame line")
		end,
	}

	Perun.add {
		{ "  Git: blame line",                gs.blame_line                },
		{ "  Git: browse",                    gg.browse                    },
		{ "  Git: commit with current date",  gg.commit_with_date          },
		{ "  Git: commits",                   gg.commits                   },
		{ "  Git: file commits",              gg.file_commits              },
		{ "  Git: file versions",             gg.file_versions             },
		{ "  Git: grep",                      gg.grep                      },
		{ "  Git: preview hunk",              gs.preview_hunk              },
		{ "  Git: push",                      gg.push                      },
		{ "  Git: reset buffer",              gs.reset_buffer              },
		{ "  Git: search 4 differences",      gg.search4differences        },
		{ "  Git: set loclist",               gs.setloclist                },
		{ "  Git: set quickfix",              gs.setqflist                 },
		{ "  Git: stage buffer",              gs.stage_buffer              },
		{ "  Git: toggle deleted",            gs.toggle_deleted            },
		{ "  Git: toggle line blame",         gs.toggle_current_line_blame },
	}

-- }}}
-- Help {{{
-- }}}
-- Navigation {{{
-- }}}
-- Print {{{

	Perun.add {
		{ "  Print file",                  "hardcopy" },
		{ "  Convert to HTML",             "TOhtml" },
		{ "  Convert to PDF",              "hardcopy > %.ps | !ps2pdf %.ps && rm %.ps" },
	}

-- }}}
-- Search {{{

	Set {
		ignorecase = true,
		smartcase  = true,
		hlsearch   = false,
	}

-- }}}
-- Snippets {{{

	Plugin {
		"https://github.com/adriaanzon/vim-emmet-ultisnips",
		"https://github.com/SirVer/ultisnips",
	}
	Globals {
		UltiSnipsExpandTrigger       = '<tab>',
		UltiSnipsJumpForwardTrigger  = '<tab>',
		UltiSnipsJumpBackwardTrigger = '<s-tab>',
	}
	mapgroup("<leader>u",  "+Snippets")
	Noremap {
		{ "n", "<leader>uf", ":UltiSnipsEdit<CR>",     "edit filetype snippets" },
		{ "n", "<leader>ua", ":UltiSnipsEdit!all<CR>", "edit all snippets"      },
	}
	Perun.add {
		{ "  Snippets: Edit filetype snippets",  "UltiSnipsEdit"          },
		{ "  Snippets: Edit all snippets",       "UltiSnipsEdit!all"      },
	}

	-- }}}
-- Tabs {{{

	mapgroup(
		"<leader>t", "+Tabs"
	)
	Noremap {
		{ "n",  "<leader>tt",  ":tabnew<cr>",    "new tab"   },
		{ "n",  "<leader>tc",  ":tabclose<cr>",  "close tab" },
		{ "n",  "<leader>1",   "1gt",            "tab 1"     },
		{ "n",  "<leader>2",   "2gt",            "tab 2"     },
		{ "n",  "<leader>3",   "3gt",            "tab 3"     },
		{ "n",  "<leader>4",   "4gt",            "tab 4"     },
		{ "n",  "<leader>5",   "5gt",            "tab 5"     },
	}
	Perun.add {
		{ "  New file",  "new"    },
		{ "  New tab",   "tabnew" },
	}


-- }}}
-- View {{{
	-- Noremap {
		-- { "n", "<TAB>", "za" }
	-- }
	set.foldlevelstart = 99
	set.foldmethod     = "expr"
	set.foldexpr       = "nvim_treesitter#foldexpr()"
	-- set.foldtext       = "v:lua.Foldtext()"
	-- https://vi.stackexchange.com/questions/25820/maintain-alignment-of-text-after-folding
	-- function Foldtext()
	-- 	local fs = vim.api.nvim_get_vvar("foldstart")
	-- 	local line = vim.fn.trim(vim.fn.getline(fs))
	-- 	local indent = vim.fn.indent(fs)
	-- 	-- return string.rep(" ", indent) .. line .. "..."
	-- 	local indent_spaces = string.rep(" ", indent)
	-- 	return string.format("%s▶ %s...", indent_spaces, line)
	-- end

-- }}}
-- Vim {{{

	Mapgroup("<leader>v", "+Vim")

	Perun.add {

		-- Plugins ----------------------------------------------------------------
		{ "  Update plugins",              Pluger.update },
		{ "  Update plugins (debug)",      Pluger.debug_update },


		-- Windows ----------------------------------------------------------------
		{ "  Open quickfix",               "copen" },
		{ "  Close quickfix",              "cclose" },
	}

-- }}}
-- Widgets {{{
---[[

	Plugin "https://github.com/goolord/alpha-nvim"
	require'alpha'.setup(require'alpha.themes.startify'.config)

	Plugin "https://github.com/rcarriga/nvim-notify"

	vim.notify = require("notify")
	vim.notify.setup { top_down = false }

	Perun.add { "  Notification history", "Telescope notify" }
-- }}}]]
-- Yank {{{
	Yanka  = require "lib/yanka"
	Perun.add {
		{ "  Yank filename",               Yanka.filename },
		{ "  Yank relative path",          Yanka.relative_path },
		{ "  Yank full path",              Yanka.full_path },
		{ "  Yank full dir",               Yanka.full_dir },
		{ "  Yank <cfile>",                Yanka.cfile },
		{ "  Yank buffer content",         Yanka.buffer },
		{ "  Yank set clipboard",          Yanka.set_clipboard },
		{ "  Yank unset clipboard",        Yanka.unset_clipboard },
	}
-- }}}


nnoremap("<C-P>", Perun.run)
Require {

	-- Configuration -----------------------
	"conf/mappings",
	"conf/lualine",

	-- Tools -------------------------------
	"tool/trouble",
	"tool/telescope",
	"tool/nvim-tree",
	-- "tool/oil",
	"tool/cheatash",
	"tool/colorizer",
	"tool/figlet",
	-- "tool/rest",

	-- leave this in external files
	-- "tool/completion",
}


Jumper = require "lib/jumper"

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end

-- print("init.lua end")
-- Weles Dazhbog Dola Zemlya Zvezda Devana Morana
