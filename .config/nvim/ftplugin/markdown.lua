vim.opt.isfname:append("32")
vim.opt_local.conceallevel=2

nnoremap_buffer("gf", ":e <cfile>.md<cr>")

Helper.map { CHEATSHEET = "https://devhints.io/markdown" }

Plugin {
	{
		"https://github.com/selimacerbas/live-server.nvim",
		config = function ()
			require("live_server").setup {
				default_port = 8000,
				live_reload = { enabled = true, inject_script = true, debounce = 120, css_inject = true },
				directory_listing = { enabled = true, show_hidden = false },
			}
		end
	},
	{
		"https://github.com/selimacerbas/markdown-preview.nvim",
		config = function()
			require("markdown_preview").setup()
			--	{
			  -- all optional; sane defaults shown
			  -- instance_mode = "takeover",  -- "takeover" (one tab) or "multi" (tab per instance)
			  -- port = 0,                    -- 0 = auto (8421 for takeover, OS-assigned for multi)
			  -- open_browser = true,
			  -- default_theme = "dark",      -- "dark" or "light"; initial preview theme
			  -- debounce_ms = 300,
			-- }
			-- )
			vim.keymap.set("n", "<F5>", "<cmd>MarkdownPreview<cr>", { desc = "Markdown: Start preview" })
		end,
	},
}

