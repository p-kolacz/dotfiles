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

local actions = require('telescope.actions')
require('telescope').setup {
	defaults = {
		prompt_prefix = "🔭",
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
		winblend = 5,
	},
	pickers = {
		symbols = {
			theme = "cursor",
		},
	},
}


-- https://github.com/nvim-telescope/telescope.nvim#pickers

--File pickers
-- nnoremap('<C-space>',  ':Telescope find_files find_command=rg,--hidden,--files<cr>')
nnoremap('<C-space>',  ':Telescope find_files theme=ivy<cr>')
nnoremap('<leader>gf', ':Telescope git_files<cr>', 'find files')
nnoremap('<leader>fc', ':Telescope grep_string<cr>', 'find cword')
nnoremap('<leader>ff', ':Telescope live_grep<cr>', 'find in files')
-- nnoremap('<leader>fb', ':Telescope file_browser theme=get_dropdown<cr>', 'browse files')

--Vim pickers
nnoremap('<leader>vb', ':Telescope buffers theme=ivy<cr>', 'buffers')
nnoremap('<leader>fh', ':Telescope oldfiles<cr>', 'history')
nnoremap('<leader>vc', ':Telescope commands<cr>', 'commands')
nnoremap('<C-p>',      ':Telescope commands theme=get_dropdown<cr>')
nnoremap('<leader>vx', ':Telescope command_history theme=get_dropdown<cr>', 'cmd history')
nnoremap('<leader>hh', ':Telescope help_tags<cr>', 'help tags')
nnoremap('<leader>vq', ':Telescope quickfix<cr>', 'quickfix list')
nnoremap('<leader>vl', ':Telescope loclist<cr>', 'loc list')
nnoremap('<leader>vo', ':Telescope vim_options theme=get_dropdown<cr>', 'options')
nnoremap('<leader>vr', ':Telescope registers<cr>', 'registers')
nnoremap('<leader>su', ':Telescope spell_suggest theme=cursor<cr>', 'suggest')
nnoremap('<leader>vk', ':Telescope keymaps<cr>', 'keymaps')
nnoremap('<leader>vf', ':Telescope filetypes theme=get_dropdown<cr>', 'filetypes')
nnoremap('<leader>vh', ':Telescope highlights<cr>', 'highlights')
nnoremap('<leader>vs', ':Telescope colorscheme theme=dropdown<cr>', 'colorschemes')
nnoremap('<leader>/',  ':Telescope current_buffer_fuzzy_find theme=ivy<cr>', 'search')

--LSP Pickers

--Git Pickers
mapgroup('<leader>gs',  '+Show')
nnoremap('<leader>gsc', ':Telescope git_commits<cr>', 'commits')
nnoremap('<leader>gsd', ':Telescope git_bcommits<cr>', 'buffer commits')
nnoremap('<leader>gsb',  ':Telescope git_branches<cr>', 'branches')
nnoremap('<leader>gss',  ':Telescope git_status<cr>', 'status')

--Treesitter
nnoremap('<leader>tt', ':Telescope treesitter<cr>', 'treesitter')

--Symbols
nnoremap('<leader>ie', ":lua require'telescope.builtin'.symbols{ sources = {'emoji'}   }<cr>", 'emoji')
nnoremap('<leader>ik', ":lua require'telescope.builtin'.symbols{ sources = {'kaomoji'} }<cr>", 'kaomoji')
nnoremap('<leader>im', ":lua require'telescope.builtin'.symbols{ sources = {'math'}    }<cr>", 'math')
nnoremap('<leader>il', ":lua require'telescope.builtin'.symbols{ sources = {'latex'}   }<cr>", 'latex')


--  Ultisnips
Plugin "https://github.com/fhill2/telescope-ultisnips.nvim"
require("telescope").load_extension("ultisnips")
nnoremap('<leader>us', ":Telescope ultisnips ultisnips theme=get_ivy<cr>", "snippets")

-- Project management
Plugin "https://github.com/nvim-telescope/telescope-project.nvim"
require"telescope".load_extension("project")
nnoremap("<leader>po", ":lua require'telescope'.extensions.project.project{}<cr>", "open")

