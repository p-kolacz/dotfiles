local commander = require("lib/commander")

return require("telescope").register_extension {
	setup = function(ext_config)
		commander.setup(ext_config)
	end,
	exports = {
		commander = commander.run
	},
}
