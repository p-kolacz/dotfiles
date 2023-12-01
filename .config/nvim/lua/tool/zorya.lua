local zorya  = require "zorya"
zorya.setup { colorschemes = require "conf/themez" }
-- zorya.restore_colorscheme()

-- zorya.auto_background()

-- Highlights must be after colorscheme
-- vim.cmd("highlight Folded gui='italic'")
-- n,  "<leader>vg", Zorya.toggle_background,             "toggle_background",

Perun.add {
	{ "  Colorschemes", zorya.select_colorscheme },
	{ "  Toggle background", zorya.toggle_background },
}
