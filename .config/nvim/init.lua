-- Bootstrap {{{
	local requirer = require "lib/bootstrap"
	Pluger = require "lib/plugozaur"
	Plugin = Pluger.plugin
	Icons  = require "lib/iconz"
	Perun = require "perun"
	Mapper = require "lib/mapper"
	Noremap = Mapper.add
	Helper = require "lib/helpozor"
	Laser  = require "lib/laserpro"
	Yanka  = require "lib/yanka"

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

-- }}}
-- Optionz {{{
	vim.cmd.language("messages en_US.utf8")
	set.autowrite      = true
	set.fileformats    = "unix"
	set.mouse          = "a"
	set.shiftwidth     = 4
	set.tabstop        = 4
	set.ignorecase     = true
	set.smartcase      = true
	set.hlsearch       = false
-- }}}
-- AutoCommandz {{{

	autocmd("BufWinEnter", {
		group = "vimrc",
		pattern = { "*/.config/nvim/init.lua", "*/.config/nvim/lua/conf/appearance.lua" },
		command = "setlocal includeexpr=stdpath('config').'/lua/'.v:fname"
	})

	vim.cmd("command! -nargs=1 Rsync :!rsync -avz --filter=':- .gitignore' ./ <args>")
-- }}}
-- Appearance {{{
	set.listchars      = Icons.listchars
	set.fillchars      = Icons.fillchars
	set.cursorline     = true
	set.wrap           = false
	set.number         = true
	set.scrolloff      = 5
	set.sidescrolloff  = 5
	set.showmatch      = true
	set.signcolumn     = "yes"
	set.splitbelow     = true
	set.splitright     = true
	set.termguicolors  = true

	Icons.setup_devicons()
	Icons.setup_diagnostics()
	Yanka.enable_highlight()

	Plugin "https://github.com/RRethy/vim-illuminate"
	require "illuminate".configure {
		filetypes_allowlist = { "lua", "rails", "ruby", "sh", },
		min_count_to_highlight = 2,
	}
	Plugin "https://github.com/petertriho/nvim-scrollbar"
	require"scrollbar".setup { handlers = { cursor = false } }

	Plugin "https://github.com/lukas-reineke/indent-blankline.nvim"
	require("ibl").setup()

	Plugin "https://github.com/stevearc/dressing.nvim"

	vim.cmd.colorscheme("darkblue")

	Zorya  = require "zorya"
	Zorya.setup {
		restore_colorscheme = true,
		colorschemes = require "conf/themez",
	}

	-- Treesitter uses diffrent groups
	-- Zorya.highlight("markdownH1", "gui=bold,underline")
	-- Zorya.highlight("markdownH2", "gui=undercurl")

	Perun.add {
		{ "  Colorschemes", Zorya.select_colorscheme },
		{ "  Toggle background", Zorya.toggle_background },
	}
-- }}}
-- Code {{{
	-- Comments & Surround
	mapgroup("<leader>c", "+Code")
	Plugin {
		"https://github.com/tpope/vim-commentary",
		"https://github.com/tpope/vim-surround",
		"https://github.com/tpope/vim-repeat",
	}
	Noremap {
		{ {"n","v"},  "<BS>",   ":Commentary<cr>" },
		{ "n", "<C-/>", ":Commentary<cr><down>" }, -- C-_ means C-/ and C-? means backspace but <BS> also works
	}
	nmap("<leader>cc", "yypkgccj", 'duplicomment')

	-- Completion
	Plugin {
		"https://github.com/hrsh7th/nvim-cmp",
		'https://github.com/hrsh7th/cmp-nvim-lsp',
		'https://github.com/hrsh7th/cmp-buffer',
		'https://github.com/hrsh7th/cmp-path',
		'https://github.com/hrsh7th/cmp-cmdline',
		'https://github.com/hrsh7th/cmp-calc',
		'https://github.com/hrsh7th/cmp-emoji',
		'https://github.com/quangnguyen30192/cmp-nvim-ultisnips',
	}

	set.completeopt = "menu,menuone,noselect"
	set.pumheight = 10

	local cmp = require'cmp'
	local fields = {
		cmp.ItemField.Kind,
		cmp.ItemField.Abbr,
		cmp.ItemField.Menu
	}

	local visible_buffers = {
		name = "buffer",
		keyword_length = 2,
		get_bufnrs = function()
			local bufs = {}
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				bufs[vim.api.nvim_win_get_buf(win)] = true
			end
			return vim.tbl_keys(bufs)
		end
	}

	cmp.setup {
		experimental = { ghost_text = true, },

		mapping = cmp.mapping.preset.insert({
		  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		  ['<C-l>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		  ['<C-e>'] = cmp.mapping({ c = cmp.mapping.close(), }),
		  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),

		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'ultisnips' },
			visible_buffers,
			{ name = 'path' },
			{ name = 'emoji' },
			{ name = 'calc' },
		}),
		formatting = {
			fields = fields,
			format = function(entry, vim_item)
				vim_item.kind = Icons.kinds[vim_item.kind]
				vim_item.menu = Icons.sources[entry.source.name]
				return vim_item
			end
		},
		snippet = { -- REQUIRED - you must specify a snippet engine
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
	}

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
		}, {
			{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		},
	})

	if Laser then
		Laser.defaults.capabilities = require('cmp_nvim_lsp').default_capabilities()
	end

-- }}}
-- Diagnostics {{{
	Perun.add {
		{ "  Show diagnostics",            vim.diagnostic.show },
		{ "  Hide diagnostics",            vim.diagnostic.hide },
	}
	-- }}}
-- Edit {{{
	mapgroup("<leader>e", "+Edit")
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
	}
	Perun.add {
		{ "  Edit: Capitalize buffer",          [[%s/\<./\u&/g]]    },
		{ "  Edit: Capitalize line",            [[s/\<./\u&/g]]     },
		{ "  Edit: Remove trailing spaces",     "%s/\\s\\+$//e"     },
		{ "  Edit: Reverse all lines",          "g/^/m0"            },
		{ "  Edit: Unicode chars from \\uXXXX", [[%s/\\\(\x\+\)/\=nr2char('0x'.submatch(1),1)/g]] },
	}
-- }}}
-- File {{{

	mapgroup("<leader>f", "+File")
	Plugin "https://github.com/goolord/alpha-nvim"
	require'alpha'.setup(require'alpha.themes.startify'.config)
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

	local gitgud = require "gitgud"
	mapgroup("<leader>g", "+Git")
	Noremap {
		{ "n",  "<leader>gg",  gitgud.lazygit },
	}
	Perun.add {
		{ "  Git: Commit with current date", gitgud.commit_with_date },
		{ "  Git: push",                     gitgud.push },
	}

-- }}}
-- Help {{{
-- }}}
-- Insert {{{
-- }}}
-- Jump {{{
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
	nnoremap("<leader>uf", ":UltiSnipsEdit<CR>", "edit filetype snippets")
	nnoremap("<leader>ua", ":UltiSnipsEdit!all<CR>", "edit all snippets")
	Perun.add {
		{ "  Snippets: Edit filetype snippets",  "UltiSnipsEdit" },
		{ "  Snippets: Edit all snippets",       "UltiSnipsEdit!all" },
	}
	-- }}}
-- Tabs {{{
-- }}}
-- Treesitter {{{
	Plugin {
		"https://github.com/nvim-treesitter/nvim-treesitter",
		"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		"https://github.com/nvim-treesitter/nvim-treesitter-context",
	}

	require"nvim-treesitter.configs".setup {
		ensure_installed = {
			"awk", "bash", "c", "c_sharp", "clojure", "cmake", "comment", "cpp", "css", "diff", "dockerfile", "dot",
			"gdscript", "git_rebase", "gitattributes", "gitcommit", "gitignore", "glsl", "go", "godot_resource", "gomod", "gowork",
			"hjson", "html", "http", "ini", "java", "javascript", "jq", "jsdoc", "json", "latex", "lua", "make",
			"markdown", "markdown_inline", "mermaid", "org", "perl", "php", "phpdoc", "python", "regex", "ruby", "rust", "scss",
			"sql", "toml", "typescript", "vhs", "vim", "vimdoc", "xml", "yaml",
		},
		highlight = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,	-- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ao"] = "@block.outer",
					["io"] = "@block.inner",
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
				}
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					[']f'] = '@function.outer',
				},
				goto_previous_start = {
					['[f'] = '@function.outer',
				},
			},
			swap = {
				enable = true,
				swap_next = {["<a-l>"] = "@parameter.inner"},
				swap_previous = {["<a-h>"] = "@parameter.inner"}
			},
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "vv", -- set to `false` to disable one of the mappings
				scope_incremental = "<cr>",
				node_incremental = "<tab>",
				node_decremental = "<s-tab>",
			},
		},
	}

	require"treesitter-context".setup()

	Perun.add {
		{ "  TS: Enable highlight",  "TSBufEnable highlight"  },
		{ "  TS: Disable highlight", "TSBufDisable highlight" },
		{ "  TS: Context toggle",    "TSContextToggle"        },
	}
--}}}
-- View {{{
	Noremap {
		{ "n", "<TAB>", "za" }
	}
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
-- Widgets {{{
---[[
	Plugin "https://github.com/rcarriga/nvim-notify"

	vim.notify = require("notify")
	vim.notify.setup { top_down = false }

	Perun.add { "  Notification history", "Telescope notify" }
-- }}}]]
-- Windows {{{
-- }}}
-- Yank {{{
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
requirer {

	-- Configuration -----------------------
	"conf/mappings",
	"conf/lualine",

	-- Tools -------------------------------
	"tool/perun",
	"tool/lsp",
	"tool/trouble",
	"tool/telescope",
	"tool/nvim-tree",
	"tool/oil",
	"tool/gitsigns",
	"tool/cheatash",
	"tool/colorizer",
	"tool/figlet",
	"tool/rest",
}


Jumper = require "lib/jumper"
-- require "lib/animate".setup()

-- Load project specific configuration
if vim.fn.filereadable("project.lua") > 0 then
	require "project"
end

-- print("init.lua end")
-- Weles Dazhbog Dola Zemlya Zvezda Devana Morana
