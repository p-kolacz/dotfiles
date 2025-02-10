-- .__   __.  _______   ______   ____    ____  __  .___  ___. 
-- |  \ |  | |   ____| /  __  \  \   \  /   / |  | |   \/   | 
-- |   \|  | |  |__   |  |  |  |  \   \/   /  |  | |  \  /  | 
-- |  . `  | |   __|  |  |  |  |   \      /   |  | |  |\/|  | 
-- |  |\   | |  |____ |  `--'  |    \    /    |  | |  |  |  | 
-- |__| \__| |_______| \______/      \__/     |__| |__|  |__| 

-- Bootstrap {{{

	Require  = require "bootstrap".require
	Plugin   = require "plugozaur".add
	Icons    = require "iconz"
	Perun    = require "perun".add
	Mapper   = require "mapper"
	Helper   = require "helpozor"

	Plugin "https://github.com/folke/which-key.nvim"
	WK = require("which-key")
	WK.setup {
		icons = {
			mappings = false,
		},
		layout = {
			align = "center",
		},
		-- ignore_missing = true, -- wainting for merge
	}

	vim.g.mapleader = " "
	vim.g.maplocalleader = "_"
	augroup("vimrc", { clear = true })

	autocmd("BufWinEnter", {
		group = "vimrc",
		pattern = { "*/.config/nvim/init.lua" },
		command = "setlocal includeexpr=stdpath('config').'/lua/'.v:fname"
	})

	vim.cmd("command! -nargs=1 Rsync :!rsync -avz --filter=':- .gitignore' ./ <args>")

	Plugin "https://github.com/nvim-lua/plenary.nvim"

	if vim.g.started_by_firenvim then
		require "conf/firenvim"
	else
		NVIM_MODE = "standalone"
	end

-- }}}
-- Appearance {{{

	vim.cmd.language("messages en_US.utf8")
	Require {
		"conf/lualine",
		"conf/colorizer",
	}
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
		-- termguicolors = true,
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
	if NVIM_MODE == "firenvim" then
		Zorya.set_colorscheme("Rosé Pine", "dawn", false)
	end

	-- Treesitter uses diffrent groups
	-- Zorya.highlight("markdownH1", "gui=bold,underline")
	-- Zorya.highlight("markdownH2", "gui=undercurl")

	Noremap {
		{ "G",  "<leader>o",   "Options"                                              },
		{ "n",  "<leader>ol",  ":set list!<CR>",            "toggle invisible chars"  },
		{ "n",  "<leader>on",  ":set number!<CR>",          "toggle line numbers"     },
		{ "n",  "<leader>or",  ":set relativenumber!<CR>",  "toggle relative numbers" },
		{ "n",  "<leader>ow",  ":set wrap!<CR>",            "toggle wrap"             },
	}
	Perun {
		{ "  Colorschemes",       Zorya.select_colorscheme },
		{ "  Toggle background",  Zorya.toggle_background  },
	}

-- }}}
-- Code {{{

	Laser  = require "laserpro"
	Require {
		"conf/completion",
		"conf/lsp",
		"conf/treesitter",
	}
	Plugin {
		"https://github.com/tpope/vim-commentary",
		"https://github.com/tpope/vim-surround",
		"https://github.com/tpope/vim-repeat",
	}
	nmap("<leader>cc", "yypkgccj", 'duplicomment')
	Noremap {
		{ "G",        "<leader>c",  "+Code"                                     },
		{ {"n","v"},  "<BS>",       ":Commentary<cr>"                           },
		{ "n",        "<C-/>",      ":Commentary<cr><down>"                     },
		{ "n",        "[d",         vim.diagnostic.goto_prev, "prev diagnostic" },
		{ "n",        "]d",         vim.diagnostic.goto_next, "next diagnostic" },
	}
	Perun {
		{ "  Diagnostics: Show",            vim.diagnostic.show       },
		{ "  Diagnostics: Hide",            vim.diagnostic.hide       },
		{ "  Diagnostics: Set Loclist",     vim.diagnostic.setloclist },
	}

-- }}}
-- Commands & Command Mode {{{

	Noremap {
		{ "n",  "<leader><leader>",  ":",                 "command mode", },
		{ "n",  "<C-P>",             require"perun".run,                  },
		{ "c",  "<C-a>",             "<home>",                            },
		{ "c",  "<A-f>",             "<S-right>",                         },
		{ "c",  "<C-b>",             "<left>",                            },
		{ "c",  "<A-b>",             "<S-left>",                          },
	}

--}}}
-- Edit {{{

	Require {
		"conf/figlet"
	}
	Set {
		shiftwidth  = 4,
		tabstop     = 4,
		autowrite   = true,
		mouse       = "a",
		viewoptions = "cursor,folds"
	}
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
		{ "G",  "<leader>e",   "+Edit"                               },
		{ "n",  "<leader>es",  ":%s/",            "substitute"       },
		{ "v",  "<leader>es",  ":s/",             "substitute"       },
		{ "n",  "<leader>er",  ":g/^/m0<CR>",     "reverse lines"    },
		{ "v",  "<leader>er",  ":'<,'>!tac<CR>",  "reverse lines"    },
		-- change cword and press . to repeat change on next, n to goto next
		{ "n",  "<leader>ed",  ":let @/='\\<'.expand('<cword>').'\\>'<cr>cgn", "change&repeat" },
		{ "x",  "<leader>ed",  "\"sy:let @/=@s<cr>cgn",                        "change&repeat" },
		{ "n",	"<leader>w",   ":w<CR>",			               "write", },
		{ "G",  "<leader>f", "+File" },
		{ "n",  "<leader>fd",  ":e <C-R>=expand('%:p:h').'/'<CR>", "current file dir" },
		{ "n",  "<leader>fn",  ":new<cr>",                         "new file" },
		{ "n",  "<leader>fx",  ":silent !chmod +x %<cr>:e<cr>",    "chmod +x" },
		{ "t",  "<Esc>",       "<C-/><C-n>",                         },
	}
	Map {
		{ "n",  '<leader>"',   'ysiW"',  '"cWord"'                 },
		{ "n",  "<leader>'",   "ysiW'",  "'cWord'"                 },
		{ "n",  "<leader>e'",  [[cs"']], "change surrounding to '" },
		{ "n",  '<leader>e"',  [[cs'"]], 'change surrounding to "' },
	}
	Perun {
		{ "  Edit: Capitalize buffer",          [[%s/\<./\u&/g]]    },
		{ "  Edit: Capitalize line",            [[s/\<./\u&/g]]     },
		{ "  Edit: Remove trailing spaces",     "%s/\\s\\+$//e"     },
		{ "  Edit: Reverse all lines",          "g/^/m0"            },
		{ "  Edit: Unicode chars from \\uXXXX", [[%s/\\\(\x\+\)/\=nr2char('0x'.submatch(1),1)/g]] },
	}

	autocmd("FocusLost", {
		group = "vimrc",
		pattern = "*",
		command = "wall",
	})
	autocmd("BufWinLeave", { -- Remeber foldings and stuff...
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

	local gs = require "conf/gitsigns"
	local gg = require "gitgud"

	mapgroup("<leader>g", "+Git")
	Noremap {
		{ "n",  "<leader>gg",  gg.status, "status" },
		{ "n",  "<leader>gb",  gs.blame_line, "blame line" }
	}

	Perun {
		{ "  Git: blame line",                gs.blame_line                },
		{ "  Git: browse",                    gg.browse                    },
		{ "  Git: commit with current date",  gg.commit_with_date          },
		{ "  Git: commits",                   gg.commits                   },
		{ "  Git: file commits",              gg.file_commits              },
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

	require 'cheatash'.setup()

	Noremap {
		{ "G", "<leader>h",    "+Help",                                         },
		{ "n", "gy",           Helper.search_this,    "online search cword"     },
		{ "v", "gy",           Helper.search_this,    "online search selection" },
		{ "n", "<leader>hn",   Helper.edit_ft_notes,  "filetype notes"          },

		{ "G", "<leader>hC",   "+Cheat.sh"                                      },
		{ "n", "<leader>hCc",  ":CheatshCword<cr>",   "cheat.sh cword"          },
		{ "n", "<leader>hCq",  ":Cheatsh ",           "cheat.sh query"          },
	}

-- }}}
-- Navigation {{{

	Require {
		"conf/telescope",
		"conf/nvim-tree",
	}
	Jumper = require "jumper" -- after nvim-tree

	local config = require"bootstrap"
	Noremap {
		{ "i",  "jj",         "<ESC>",                                      },
		{ "i",  "kk",         "<ESC>",                                      },
		{ "i",  "jk",         "<ESC>",                                      },
		{ {"n", "v"},  "H",  "^",                                           },
		{ {"n", "v"},  "L",  "$",                                           },
		{ "n",  "[q",         ":cprevious<cr>",  "next quickfix entry",     },
		{ "n",  "]q",         ":cnext<cr>",      "previous quickfix entry", },
		{ "n",  "[l",         ":lprevious<cr>",  "next loclist entry",      },
		{ "n",  "]l",         ":lnext<cr>",      "previous loclist entry",  },
		{ "n",  "<F10>",      config.edit_init                              },
		{ "n",  "<F9>",       config.edit_ft                                },
		{ "G",  "<leader>j",  "+Jump"                                       },
	}

	-- Not working for some reason
	-- Map{
	-- 	{ "n",  "<X1Mouse>",  "<C-O>" },
	-- 	{ "n",  "<X2Mouse>",  "<C-I>" },
	-- }

-- }}}
-- Print {{{

	Perun {
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
	Noremap {
		{ "v", "/", "<ESC>/\\%V" },
		{ "n",  "<leader>oh",  ":set hlsearch!<CR>",        "toggle higlight search"  },
	}

-- }}}
-- Snippets {{{

	Plugin {
		"https://github.com/adriaanzon/vim-emmet-ultisnips",
		"https://github.com/SirVer/ultisnips",
	}

	vim.g.UltiSnipsExpandTrigger       = '<tab>'
	vim.g.UltiSnipsJumpForwardTrigger  = '<tab>'
	vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'

	mapgroup("<leader>u",  "+Snippets")
	Noremap {
		{ "n", "<leader>uf", ":UltiSnipsEdit<CR>",     "edit filetype snippets" },
		{ "n", "<leader>ua", ":UltiSnipsEdit!all<CR>", "edit all snippets"      },
	}
	Perun {
		{ "  Snippets: Edit filetype snippets",  "UltiSnipsEdit"          },
		{ "  Snippets: Edit all snippets",       "UltiSnipsEdit!all"      },
	}

	-- }}}
-- Tabs {{{

	mapgroup(
		"<leader>t", "+Tabs"
	)
	Noremap {
		{ "n", "<c-t>",       ":tabnew<cr>"                 },
		{ "n", "<leader>tt",  ":tabnew<cr>",    "new tab"   },
		{ "n", "<leader>tq",  ":tabclose<cr>",  "close tab" },
		{ "n", "<leader>1",   "1gt",            "tab 1"     },
		{ "n", "<leader>2",   "2gt",            "tab 2"     },
		{ "n", "<leader>3",   "3gt",            "tab 3"     },
		{ "n", "<leader>4",   "4gt",            "tab 4"     },
		{ "n", "<leader>5",   "5gt",            "tab 5"     },
	}
	Perun {
		{ "  New file",  "new"    },
		{ "  New tab",   "tabnew" },
	}


-- }}}
-- Tools & Widgets {{{
---[[

	Require "conf/rest"
	-- Plugin "https://github.com/goolord/alpha-nvim"
	-- require'alpha'.setup(require'alpha.themes.startify'.config)

	Plugin "https://github.com/rcarriga/nvim-notify"

	local notify = require("notify")
	notify.setup { top_down = false }
	vim.notify = notify

	Noremap {
		{ "G",  "<leader>s",   "+Spell",                                              },
		{ "n",  "<leader>ss",  ":set spell!<CR>",             "spell check", },
		{ "n",  "<leader>sc",  ":set complete+=kspell<CR>",   "spell complete", },
		{ "n",  "<leader>sn",  ":set complete-=kspell<CR>",   "spell no complete", },
		{ "n",  "<leader>se",  ":set spelllang=en_us<CR>",    "lang en_us", },
		{ "n",  "<leader>sp",  ":set spelllang=pl<CR>",       "lang pl", },
	}

	Perun { "  Notification history", "Telescope notify" }

-- }}}]]
-- View {{{
	-- Noremap {
		-- { "n", "<TAB>", "za" }
	-- }
	Set {
		foldlevelstart = 99,
		foldmethod     = "expr",
		foldexpr       = "nvim_treesitter#foldexpr()",
	}
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

	Noremap {
		{ "G",  "<leader>d",   "+Diff",                      },
		{ "n",  "<leader>dd",  ":diffthis<cr>",  "diff this" },
		{ "n",  "<leader>do",  ":diffoff!<cr>",  "diff off"  },
		---------------------------------- Windows ---------------------------------
		{ "n",  "<leader>q",  ":q<CR>", "quit", },
		{ "n",  "<C-h>",  "<C-w>h", "left window", },
		{ "n",  "<C-j>",  "<C-w>j", "bottom window", },
		{ "n",  "<C-k>",  "<C-w>k", "up window", },
		{ "n",  "<C-l>",  "<C-w>l", "right window", },
		{ "n",  "<C-A-h>",  "<C-w>h<C-w>|", "left window", },
		{ "n",  "<C-A-j>",  "<C-w>j<C-w>_", "bottom window", },
		{ "n",  "<C-A-k>",  "<C-w>k<C-w>_", "up window", },
		{ "n",  "<C-A-l>",  "<C-w>l<C-w>|", "right window", },
	}

-- }}}
-- Vim {{{

	Mapgroup("<leader>v", "+Vim")

	local plugger = require "plugozaur"
	Perun {

		-- Plugins ----------------------------------------------------------------
		{ "  Update plugins",              plugger.update },
		{ "  Update plugins (debug)",      plugger.debug_update },


		-- Windows ----------------------------------------------------------------
		{ "  Open quickfix",               "copen" },
		{ "  Close quickfix",              "cclose" },
	}

-- }}}
-- Yank {{{

	Noremap { "v",  "<C-c>",       '"*y :let @+=@*<CR>' }
	Map     { "",   "<C-v>",       '"+P' }

	Yanka  = require "yanka"
	Noremap { "n",  "<leader>yr",  Yanka.relative_path }
	Perun {
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
-- Project conf {{{

	-- Load project specific configuration
	if vim.fn.filereadable("project.lua") > 0 then
		require "project"
	end

-- }}}

-- vim:foldmethod=marker
