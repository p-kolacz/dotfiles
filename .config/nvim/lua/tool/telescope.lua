 -- _____    _                                             _
-- |_   _|__| | ___  ___  ___ ___  _ __   ___   _ ____   _(_)_ __ ___
 --  | |/ _ \ |/ _ \/ __|/ __/ _ \| '_ \ / _ \ | '_ \ \ / / | '_ ` _ \
 --  | |  __/ |  __/\__ \ (_| (_) | |_) |  __/_| | | \ V /| | | | | | |
 --  |_|\___|_|\___||___/\___\___/| .__/ \___(_)_| |_|\_/ |_|_| |_| |_|
 --                               |_|

Plugin {
	"https://github.com/nvim-lua/popup.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-symbols.nvim",
}

local actions   = require "telescope.actions"
local trouble   = require "trouble.providers.telescope"
local telescope = require "telescope"

telescope.setup {
	defaults = {
		prompt_prefix = "🔭",
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<c-t>"] = trouble.open_with_trouble
			},
		},
	},
	pickers = {
		find_files	= { theme = "ivy", initial_mode = "insert" },
		git_files	= { theme = "ivy", initial_mode = "insert"},
		grep_string	= { theme = "ivy" },
		live_grep	= { theme = "ivy" },
		buffers		= { theme = "ivy", initial_mode = "insert" },
		oldfiles	= { theme = "ivy", initial_mode = "insert" },
		current_buffer_fuzzy_find	= { theme = "ivy" },
		symbols		= { theme = "cursor" },
		vim_options = { theme = "dropdown" },
	},
}


-- https://github.com/nvim-telescope/telescope.nvim#pickers

--File pickers
-- nnoremap('<C-space>',  ':Telescope find_files find_command=rg,--hidden,--files<cr>')
nnoremap('<C-space>',  ':Telescope find_files<cr>')
nnoremap('<leader>gf', ':Telescope git_files<cr>', 'find files')
nnoremap('<leader>fc', ':Telescope grep_string<cr>', 'find cword')
nnoremap('<leader>ff', ':Telescope live_grep<cr>', 'find in files')
-- nnoremap('<leader>fb', ':Telescope file_browser theme=get_dropdown<cr>', 'browse files')

--Vim pickers
nnoremap('<leader>vb', ':Telescope buffers<cr>', 'buffers')
nnoremap('<leader>fh', ':Telescope oldfiles<cr>', 'history')
nnoremap('<leader>vc', ':Telescope commands<cr>', 'commands')
-- nnoremap('<C-p>',      ':Telescope commands theme=get_dropdown<cr>')
-- nnoremap('<leader>vx', ':Telescope command_history theme=get_dropdown<cr>', 'cmd history')
nnoremap('<leader>hh', ':Telescope help_tags<cr>', 'help tags')
nnoremap('<leader>vq', ':Telescope quickfix<cr>', 'quickfix list')
nnoremap('<leader>vl', ':Telescope loclist<cr>', 'loc list')
-- nnoremap('<leader>vo', ':Telescope vim_options theme=get_dropdown<cr>', 'options')
-- nnoremap('<leader>vr', ':Telescope registers<cr>', 'registers')
nnoremap('<leader>su', ':Telescope spell_suggest theme=cursor<cr>', 'suggest')
-- nnoremap('<leader>vk', ':Telescope keymaps<cr>', 'keymaps')
-- nnoremap('<leader>vf', ':Telescope filetypes theme=get_dropdown<cr>', 'filetypes')
-- nnoremap('<leader>vh', ':Telescope highlights<cr>', 'highlights')
-- nnoremap('<leader>vh', ':Telescope reloader<cr>', 'lua modules')
nnoremap('<leader>vs', ':Telescope colorscheme theme=dropdown<cr>', 'colorschemes')
nnoremap('<leader>/',  ':Telescope current_buffer_fuzzy_find<cr>', 'search')

--LSP Pickers
nnoremap('<leader>cf', ':Telescope lsp_references<cr>', 'references')
-- nnoremap('<leader>Dt', ':Telescope diagnostics<cr>', 'diagnostics')

--Git Pickers
-- mapgroup('<leader>gs',  '+Show')
-- nnoremap('<leader>gsc', ':Telescope git_commits<cr>', 'commits')
-- nnoremap('<leader>gsd', ':Telescope git_bcommits<cr>', 'buffer commits')
-- nnoremap('<leader>gsb',  ':Telescope git_branches<cr>', 'branches')
nnoremap('<leader>gss',  ':Telescope git_status<cr>', 'status')

--Treesitter
-- nnoremap('<leader>vtt', ':Telescope treesitter<cr>', 'treesitter')

--Symbols
nnoremap('<leader>ie', ":lua require'telescope.builtin'.symbols{ sources = {'emoji'}   }<cr>", 'emoji')
nnoremap('<leader>ik', ":lua require'telescope.builtin'.symbols{ sources = {'kaomoji'} }<cr>", 'kaomoji')
nnoremap('<leader>im', ":lua require'telescope.builtin'.symbols{ sources = {'math'}    }<cr>", 'math')
nnoremap('<leader>il', ":lua require'telescope.builtin'.symbols{ sources = {'latex'}   }<cr>", 'latex')

--  Ultisnips
Plugin "https://github.com/fhill2/telescope-ultisnips.nvim"
telescope.load_extension("ultisnips")
nnoremap('<leader>us', ":Telescope ultisnips ultisnips theme=get_ivy<cr>", "snippets")

-- Project management
Plugin "https://github.com/nvim-telescope/telescope-project.nvim"
telescope.load_extension("project")
mapgroup('<leader>p',  '+Project')
nnoremap("<leader>po", ":lua require'telescope'.extensions.project.project{}<cr>", "open")

Plugin "https://github.com/LinArcX/telescope-env.nvim"
telescope.load_extension('env')

Plugin("https://github.com/nvim-telescope/telescope-fzy-native.nvim", function(dir)
	vim.cmd("!cd "..dir.." && git submodule init && git submodule update")
end)
telescope.load_extension('fzy_native')

local builtin = require "telescope.builtin"

Cmdr.add {
	{ "Diagnostics",        builtin.diagnostics  },
	{ "Env variables",      "Telescope env"      },

	{ "Git branches",       builtin.git_branches },
	{ "Git buffer commits", builtin.git_bcommits },
	{ "Git commits",        builtin.git_commits  },
	{ "Git status",         builtin.git_status   },

	{ "Lua reloader",       builtin.reloader     },

	{ "Insert emoji",       function() builtin.symbols{sources={'emoji'}} end },
	{ "Insert gitmoji",     function() builtin.symbols{sources={'gitmoji'}} end },
	{ "Insert kamoji",      function() builtin.symbols{sources={'kaomoji'}} end },
	{ "Insert latex",       function() builtin.symbols{sources={'latex'}} end },
	{ "Insert math",        function() builtin.symbols{sources={'math'}} end },
	{ "Insert nerd",        function() builtin.symbols{sources={'nerd'}} end },

	{ "Treesitter fun&var", builtin.treesitter   },

	{ "Vim commands",       builtin.commands     },
	{ "Vim filetypes",      builtin.filetypes    },
	{ "Vim highlights",     builtin.highlights   },
	{ "Vim keymaps",        builtin.keymaps      },
	{ "Vim options",        builtin.vim_options  },
	{ "Vim registers",      builtin.registers    },
	-- { "", "" },
	-- { "", "" },
}

-- local telescope = require "telescope"
telescope.load_extension("commander")
nnoremap("<A-x>", ":Telescope commander<cr>", "commander")
nnoremap("<C-P>", ":Telescope commander<cr>", "commander")

