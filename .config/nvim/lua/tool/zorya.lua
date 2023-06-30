local zorya  = require "zorya"
zorya.setup { colorschemes = require "conf/themez" }

require "conf/themes"
zorya.auto_background()
zorya.colorscheme "catppuccin-macchiato"

-- Highlights must be after colorscheme
vim.cmd("highlight Folded gui='italic'")
-- n,  "<leader>vg", Zorya.toggle_background,             "toggle_background",

Perun.add {
	{ "  Toggle background", zorya.toggle_background },
}
