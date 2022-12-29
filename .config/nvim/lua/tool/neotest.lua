Plugin {
	"https://github.com/nvim-neotest/neotest",
	"https://github.com/olimorris/neotest-rspec",
}

require("neotest").setup({
	adapters = {
		require("neotest-rspec")({
			rspec_cmd = function()
				return {
					os.getenv('HOME').."/.config/nvim/bin/test-docker-bridge.sh",
					vim.fn.getcwd(),
					'app',
				}
			end
		}),
	},
})

mapgroup("<leader>t", "+Tests")
nnoremap("<leader>tn", ":lua require('neotest').run.run()<cr>", "nearest")
nnoremap("<leader>tt", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "current")
nnoremap("<leader>ts", ":lua require('neotest').run.stop()<cr>", "stop nearest")
mapgroup("<leader>to", "+Window")
nnoremap("<leader>top", ":lua require('neotest').output_panel.open()<cr>", "panel")
nnoremap("<leader>tos", ":lua require('neotest').summary.open()<cr>", "summary")

