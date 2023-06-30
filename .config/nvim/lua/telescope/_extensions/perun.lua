local perun = require("perun")

return require("telescope").register_extension {
	setup = function()
		perun.setup()
	end,
	exports = {
		perun = perun.run
	},
}
