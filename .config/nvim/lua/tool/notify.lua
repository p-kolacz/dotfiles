Plugin "https://github.com/rcarriga/nvim-notify"

vim.notify = require("notify")
vim.notify.setup {
	top_down = false
}

Perun.add { "  Notification history", "Telescope notify" }

-- vim.cmd [[
-- 	highlight link NotifyERRORBody Normal
-- 	highlight link NotifyWARNBody Normal
-- 	highlight link NotifyINFOBody Normal
-- 	highlight link NotifyDEBUGBody Normal
-- 	highlight link NotifyTRACEBody Normal
-- ]]

