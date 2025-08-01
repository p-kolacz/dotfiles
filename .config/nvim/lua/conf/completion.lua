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

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.pumheight = 10

local cmp = require'cmp'
-- if not cmp then return end

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
		['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
		['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
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
