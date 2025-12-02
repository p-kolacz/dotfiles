Plugin {
	"https://github.com/github/copilot.vim",
	"https://github.com/CopilotC-Nvim/CopilotChat.nvim",
}
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })
vim.keymap.set('n', '<leader>cc', ':CopilotChatToggle<CR>', { silent = true })
