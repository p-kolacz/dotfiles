Plugin "https://github.com/folke/trouble.nvim"

mapgroup("<leader>x", "+Trouble")
nnoremap("<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "diagnostics")
nnoremap("<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "buffer diagnostics")
nnoremap("<leader>xq", "<cmd>Trouble qflist toggle<cr>", "quickfix")
nnoremap("<leader>xl", "<cmd>Trouble loclist toggle<cr>", "loclist")

Perun {
	{ "Trouble: Symbols", "Trouble symbols toggle focus=false" },
	{ "Trouble: LSP",     "Trouble lsp toggle focus=false win.position=right" },
}

-- local trouble_telescope = require("trouble.sources.telescope")

-- require("telescope").setup({
--   defaults = {
--     mappings = {
--       i = {
-- 		  ["<c-t>"] = trouble_telescope.open,
-- 	  },
--       n = {
-- 		  ["<c-t>"] = trouble_telescope.open,
-- 		  ["<c-T>"] = trouble_telescope.add,
-- 	  },
--     },
--   },
-- })
