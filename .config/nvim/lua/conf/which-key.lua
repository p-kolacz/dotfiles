Plugin "https://github.com/folke/which-key.nvim"

WK = require("which-key")
WK.setup {
	icons = {
		mappings = false,
	},
	layout = {
		align = "center",
	},
	-- ignore_missing = true, -- wainting for merge
}
