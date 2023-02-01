local commander = require("lib/commander")

return require("telescope").register_extension {
	setup = function()
		commander.setup()
	end,
	exports = {
		commander = commander.run
	},
}
