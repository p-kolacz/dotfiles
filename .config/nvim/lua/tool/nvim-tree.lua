Plugin "https://github.com/kyazdani42/nvim-tree.lua"

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
		-- icons = { glyphs = { git = {
			-- unstaged = "*",
			-- staged = "✓",
			-- unmerged = "",
			-- renamed = "➜",
			-- untracked = "",
			-- deleted = "",
			-- ignored = "◌",
		-- }}}
	},
	view = {
		width = 40,
		mappings = {
			custom_only = false,
			list = {
				{ key = "l", action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = "H", action = "collapse_all" },
				{ key = "<C-F>", action = "grep in dir", action_cb = grep_in_dir },
			},
		},
	},
	actions = {
		open_file = {
			resize_window = false,
		},
	},
}

nnoremap('<F8>', ':NvimTreeToggle<cr>')
nnoremap('<leader>fb', ':NvimTreeToggle<cr>', 'file browser')
nnoremap('<leader>fl', ':NvimTreeFindFile<cr>', 'locate in tree')

-- hide cursor
require("nvim-tree.view").View.winopts.cursorline = true
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

Cmdr.add {
	{ "Open NvimTree",  "NvimTreeOpen"  },
	{ "Close NvimTree", "NvimTreeClose" },
}

