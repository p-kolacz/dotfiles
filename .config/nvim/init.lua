-- '##::: ##:'########::'#######::'##::::'##:'####:'##::::'##:
--  ###:: ##: ##.....::'##.... ##: ##:::: ##:. ##:: ###::'###:
--  ####: ##: ##::::::: ##:::: ##: ##:::: ##:: ##:: ####'####:
--  ## ## ##: ######::: ##:::: ##: ##:::: ##:: ##:: ## ### ##:
--  ##. ####: ##...:::: ##:::: ##:. ##:: ##::: ##:: ##. #: ##:
--  ##:. ###: ##::::::: ##:::: ##::. ## ##:::: ##:: ##:.:: ##:
--  ##::. ##: ########:. #######::::. ###::::'####: ##:::: ##:
-- ..::::..::........:::.......::::::...:::::....::..:::::..::
-- Bootstrap {{{

	require "bootstrap"

	Plugin   = require "plugozaur".add
	Perun    = require "perun".add
	Plugin "https://github.com/nvim-lua/plenary.nvim"
	Require {
		"conf/firenvim",
		"conf/which-key",
		"mapper",
	}

	vim.g.mapleader = " "
	vim.g.maplocalleader = "_"

-- }}}
-- Appearance {{{

	Icons    = require "iconz"
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
	}

	Plugin {
		"https://github.com/kyazdani42/nvim-web-devicons",
		"https://github.com/RRethy/vim-illuminate",
		"https://github.com/petertriho/nvim-scrollbar",
		"https://github.com/lukas-reineke/indent-blankline.nvim",
		"https://github.com/stevearc/dressing.nvim",
	}
	require "nvim-web-devicons".setup()
	require "illuminate".configure {
		filetypes_allowlist = { "lua", "rails", "ruby", "sh", },
		min_count_to_highlight = 2,
	}
	require"scrollbar".setup { handlers = { cursor = false } }
	require("ibl").setup {
		indent = { char = " " },
		scope =  { char = "▎" },
	}

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

	vim.api.nvim_set_hl(0, 'TrailingSpaces', { bg = '#ee3333' })
	vim.fn.matchadd('TrailingSpaces', [[\s\+$]])

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

	vim.opt.foldtext = "v:lua.CustomFoldText()"

	function CustomFoldText()
		local line = vim.fn.getline(vim.v.foldstart)
		line = line:gsub("{", "")
		return line
	end

-- }}}
-- Buffer {{{

	local fileops = require "fileops"
	Set {
		autowrite   = true,
		viewoptions = "cursor,folds"
	}
	Noremap {
		{ "G",  "<leader>f",                                "+File"               },
		{ "n",  "<leader>fn",  ":new<cr>",                  "new file"            },
		{ "n",  "<leader>fx",  fileops.chmodx,              "chmod +x"            },
		{ "n",	"<leader>w",   ":w<CR>",			        "write",              },
		{ "n",  "<a-v>",       fileops.open_from_clipboard, "open from clipboard" },
	}
	Autocmd {
		FocusLost = {
			pattern = "*",
			command = "wall",
		},
		BufWinLeave = {             -- Remeber foldings and stuff...
			pattern = "?*",			-- ?* ensures filename is not empty, for non-file buffers
			command = "mkview",
		},
		BufWinEnter = {
			pattern = "?*",
			command = "silent! loadview",
		},
	}

-- }}}
-- Code {{{

	Laser  = require "laserpro"
	Require {
		"conf/completion",
		"conf/lsp",
		"conf/treesitter",
		"conf/copilot",
	}
	Plugin {
		"https://github.com/tpope/vim-commentary",
		"https://github.com/tpope/vim-surround",
		"https://github.com/tpope/vim-repeat",
	}
	Noremap {
		{ "G",        "<leader>c",  "+Code"                 },
		{ {"n","v"},  "<BS>",       ":Commentary<cr>"       },
		{ "n",        "<C-/>",      ":Commentary<cr><down>" },
	}

-- }}}
-- Command Mode {{{

	Noremap {
		{ "n",  "<C-P>",             require"perun".run,                  },
		{ "c",  "<C-a>",             "<home>",                            },
		{ "c",  "<A-f>",             "<S-right>",                         },
		{ "c",  "<C-b>",             "<left>",                            },
		{ "c",  "<A-b>",             "<S-left>",                          },
	}

--}}}
-- Diagnostic {{{

	vim.diagnostic.config {
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = Icons.diagnostics.error,
				[vim.diagnostic.severity.WARN]  = Icons.diagnostics.warn,
				[vim.diagnostic.severity.INFO]  = Icons.diagnostics.info,
				[vim.diagnostic.severity.HINT]  = Icons.diagnostics.hint,
			},
		},
	}
	Noremap {
		{ "n",  "[d",     function () vim.diagnostic.jump {count=-1, float=true} end, "prev diagnostic" },
		{ "n",  "]d",     function () vim.diagnostic.jump {count= 1, float=true} end, "next diagnostic" },
		{ "n",  "<A-d>",  function () vim.diagnostic.jump {count= 1, float=true} end, "next diagnostic" },
	}
	Perun {
		{ "  Diagnostics: Show",            vim.diagnostic.show       },
		{ "  Diagnostics: Hide",            vim.diagnostic.hide       },
		{ "  Diagnostics: Set Loclist",     vim.diagnostic.setloclist },
	}

-- }}}
-- Edit {{{

	local edit = require "edit"
	Set {
		shiftwidth  = 4,
		tabstop     = 4,
		mouse       = "a",
	}
	Map {
		{ "n",  '<leader>"',   'ysiW"',    '"cWord"'                             },
		{ "n",  "<leader>'",   "ysiW'",    "'cWord'"                             },
		{ "n",  "<leader>ec",  "yypkgccj", 'duplicomment'                        },
	}
	Noremap {
		{ "i",  "<C-a>",       "<home>",                                         },
		{ "i",  "<C-b>",       "<left>",                                         },
		{ "i",  "<C-e>",       "<end>",                                          },
		{ "i",  "<C-d>",       "<delete>",                                       },
		{ "i",  "<C-f>",       "<right>",                                        },
		{ "i",  "<A-f>",       "<s-right>",                                      },
		{ "i",  "<A-b>",       "<s-left>",                                       },
		{ "n",  "<A-j>",       edit.move_line_down,       "move line down"       },
		{ "n",  "<A-k>",       edit.move_line_up,         "move line up"         },
		{ "v",  "<A-j>",       ":m '>+1<cr>gv=gv",        "move selection down"  },
		{ "v",  "<A-k>",       ":m '<-2<cr>gv=gv",        "move selection up"    },
		{ "G",  "<leader>e",   "+Edit"                                           },
		{ "n",  "<leader>ee",  edit.substitute_cword,     "substitute cword"     },
		{ "n",  "<leader>es",  edit.substitute_input,     "substitute"           },
		{ "v",  "<leader>es",  edit.substitute_input,     "substitute"           },
		{ "v",  "<leader>er",  ":'<,'>!tac<CR>",          "reverse lines"        },
		{ "v",  "<leader>ee",  edit.substitute_selected,  "substitute selected"  },
		{ "n",  "<leader>ed",  edit.change_repeat_cword,  "change&repeat cword"  },
		{ "x",  "<leader>ed",  edit.change_repeat_visual, "change&repeat visual" },
		{ "t",  "<Esc>",       "<C-\\><C-n>",                                    },
	}
	Perun {
		{ "  Edit: Capitalize buffer",          edit.capitalise_buffer          },
		{ "  Edit: Capitalize line",            edit.capitalise_line            },
		{ "  Edit: Remove trailing spaces",     edit.remove_trailing_spaces     },
		{ "  Edit: Reverse all lines",          edit.reverse_lines              },
		{ "  Edit: Unicode chars from \\uXXXX", edit.slash2unicode              },
	}

-- }}}
-- Git {{{

	local gs = require "conf/gitsigns"
	local gg = require "gitgud"
	Noremap {
		{ "G",  "<leader>g",                                  "+Git"        },
		{ "n",  "<A-g>",                       gg.status,     "status"      },
		{ "n",  "<leader>gg",                  gg.status,     "status"      },
		{ "n",  "<leader>gb",                  gs.blame_line, "blame line"  },
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

	Helper   = require "helpozor"
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
	Navigator = require "navigator" -- after nvim-tree
	Set {
		foldlevelstart = 99,
		foldmethod     = "expr",
		foldexpr       = "nvim_treesitter#foldexpr()",
	}
	Noremap {
		{ "G",  "<leader>j",  "+Jump"                                       },
		{ "i",  "jj",         "<ESC>",                                      },
		{ "i",  "kk",         "<ESC>",                                      },
		{ "i",  "jk",         "<ESC>",                                      },
		{ {"n", "v"},  "H",  "^",                                           },
		{ {"n", "v"},  "L",  "$",                                           },
		{ "n", "gf",          Navigator.gf,      "goto file and line"       },
		{ "n",  "[q",         ":cprevious<cr>",  "next quickfix entry",     },
		{ "n",  "]q",         ":cnext<cr>",      "previous quickfix entry", },
		{ "n",  "[l",         ":lprevious<cr>",  "next loclist entry",      },
		{ "n",  "]l",         ":lnext<cr>",      "previous loclist entry",  },
		{ "n",  "<F10>",      Navigator.goto_init                           },
		{ "n",  "<F9>",       Navigator.goto_ft                             },
	}

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
		{ "v", "/",           "<ESC>/\\%V"                                    },
		{ "n",  "<leader>oh", ":set hlsearch!<CR>", "toggle highlight search" },
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

	Mapgroup("<leader>u",  "+Snippets")
	Perun {
		{ "  Snippets: Edit filetype snippets",  "UltiSnipsEdit"          },
		{ "  Snippets: Edit all snippets",       "UltiSnipsEdit!all"      },
	}

	-- }}}
-- Tabs {{{

	Noremap {
		{ "G", "<leader>t",   "+Tabs"                       },
		{ "n", "<c-t>",       ":tabnew<cr>"                 },
		{ "n", "<leader>tt",  ":tabnew<cr>",    "new tab"   },
		{ "n", "<leader>1",   "1gt",            "tab 1"     },
		{ "n", "<leader>2",   "2gt",            "tab 2"     },
		{ "n", "<leader>3",   "3gt",            "tab 3"     },
		{ "n", "<leader>4",   "4gt",            "tab 4"     },
		{ "n", "<leader>5",   "5gt",            "tab 5"     },
	}

-- }}}
-- Tools & Widgets {{{
---[[

	-- Require "conf/rest"
	Plugin "https://github.com/rcarriga/nvim-notify"

	local notify = require("notify")
	notify.setup { top_down = false }
	vim.notify = notify

	Noremap {
		{ "G",  "<leader>s",   "+Spell",                                           },
		{ "n",  "<leader>ss",  ":set spell!<CR>",             "spell check",       },
		{ "n",  "<leader>sc",  ":set complete+=kspell<CR>",   "spell complete",    },
		{ "n",  "<leader>sn",  ":set complete-=kspell<CR>",   "spell no complete", },
		{ "n",  "<leader>se",  ":set spelllang=en_us<CR>",    "lang en_us",        },
		{ "n",  "<leader>sp",  ":set spelllang=pl<CR>",       "lang pl",           },
	}

	Perun { "  Notification history", "Telescope notify" }

-- }}}]]
-- Vim {{{

	Mapgroup("<leader>v", "+Vim")

	local plugger = require "plugozaur"
	Perun {
		{ "  Update plugins",              plugger.update },
		{ "  Update plugins (debug)",      plugger.debug_update },
	}

-- }}}
-- Windows {{{

	Noremap {
		{ "G",  "<leader>d",   "+Diff",                          },
		{ "n",  "<leader>dd",  ":diffthis<cr>",  "diff this"     },
		{ "n",  "<leader>do",  ":diffoff!<cr>",  "diff off"      },
		{ "n",  "<leader>q",   ":q<CR>",         "quit"          },
		{ "n",  "<C-h>",       "<C-w>h",         "left window"   },
		{ "n",  "<C-j>",       "<C-w>j",         "bottom window" },
		{ "n",  "<C-k>",       "<C-w>k",         "up window"     },
		{ "n",  "<C-l>",       "<C-w>l",         "right window"  },
	}
	Perun {
		{ "  Open quickfix",  "copen" },
		{ "  Close quickfix", "cclose" },
	}


-- }}}
-- Yank {{{

	local yanka  = require "yanka"
	Noremap {
		{ "n",  "<leader>yr",             yanka.relative_path,    "yank relative path" },
		{ "n",  "<A-a>",                  yanka.buffer2clipboard                       },
		{ "v",  "<C-c>",                  yanka.visual2clipboard                       },
	}
	Map { "",   "<C-v>",                  yanka.paste_from_clipboard }
	Perun {
		{ "  Yank filename",             yanka.filename             },
		{ "  Yank relative path",        yanka.relative_path        },
		{ "  Yank full path",            yanka.full_path            },
		{ "  Yank full dir",             yanka.full_dir             },
		{ "  Yank <cfile>",              yanka.cfile                },
		{ "  Yank buffer to clipboard",  yanka.buffer2clipboard     },
		{ "  Yank set clipboard",        yanka.set_clipboard        },
		{ "  Yank unset clipboard",      yanka.unset_clipboard      },
	}

-- }}}
-- Project conf {{{

	-- Load project specific configuration
	if vim.fn.filereadable("project.lua") > 0 then
		require "project"
	end

-- }}}

-- vim:foldmethod=marker
