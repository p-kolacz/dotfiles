set.isfname:append("32")
setlocal.conceallevel=2

nnoremap_buffer("gf", ":e <cfile>.md<cr>")

Helper.map { CHEATSHEET = "https://devhints.io/markdown" }

Plugin {{
	"https://github.com/toppair/peek.nvim",
	build = function(dir)
		vim.cmd("!cd "..dir.." && deno task --quiet build:fast")
	end,
	config = function()
		require("peek").setup()
		-- vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		-- vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		nnoremap_buffer("<localleader>o", require("peek").open, "Open Peek")
		nnoremap_buffer("<localleader>c", require("peek").close, "Close Peek")
	end,
}}

