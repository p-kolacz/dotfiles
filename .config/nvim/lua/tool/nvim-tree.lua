Plugin "https://github.com/kyazdani42/nvim-tree.lua"

-- Disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

local function grep_in_dir(node)
	-- v(node.absolute_path)
	local path = node.absolute_path
	path = node.type == "file" and path or path.."/**"
	vim.api.nvim_input(":vimgrep //j "..path.." | copen<home><s-right><right><right>")
end

require'nvim-tree'.setup {
	diagnostics = {
		enable = true,
		icons = {
          hint = Icons.diagnostics.hint,
          info = Icons.diagnostics.info,
          warning = Icons.diagnostics.warn,		-- sic!
          error = Icons.diagnostics.error,
		},
	},
	live_filter = {
		always_show_folders = false,
	},
	renderer = {
		full_name = true,
	},
	view = {
		width = 40,
	},
	actions = {
		open_file = {
			resize_window = false,
		},
	},
	on_attach = function(bufnr)
		local api = require('nvim-tree.api')

		local function opts(desc)
			return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		api.config.mappings.default_on_attach(bufnr)

		vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
		vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
		vim.keymap.set('n', 'H', api.tree.collapse_all, opts('Collapse'))
		vim.keymap.set('n', '<C-F>', function()
			local node = api.tree.get_node_under_cursor()
			grep_in_dir(node)
		end, opts('grep in dir'))
	end
}

nnoremap('<F8>', ':NvimTreeToggle<cr>')
nnoremap('<leader>fb', ':NvimTreeToggle<cr>', 'file browser')
nnoremap('<leader>fl', ':NvimTreeFindFile<cr>', 'locate in tree')

-- hide cursor
-- require("nvim-tree.view").View.winopts.cursorline = true
autocmd({"WinEnter", "BufWinEnter"}, {
	group = "vimrc",
	pattern = "NvimTree_1",
	callback = function ()
		 vim.cmd "highlight! Cursor blend=100"
		 vim.opt.guicursor = { "n:Cursor/lCursor", "v-c-sm:block", "i-ci-ve:ver25", "r-cr-o:hor2" }
	end,
})

autocmd({"BufLeave", "WinClosed"}, {
	group = "vimrc",
	pattern = "NvimTree_1",
	callback = function ()
		vim.cmd "highlight! Cursor blend=NONE"
		vim.opt.guicursor = { "n-v-c-sm:block", "i-ci-ve:ver25", "r-cr-o:hor20" }
	end,
})

