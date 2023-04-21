setlocal.expandtab = true
setlocal.shiftwidth = 2

Laser.start {
	name = "CoffeeSense",
	cmd = { "coffeesense-language-server", "--stdio" },
	single_file_support = true,
	-- settings = {
	-- 	dev = {
	-- 		logLevel = "INFO",
	-- 	},
	-- 	trace = {
	-- 		server = "verbose"
	-- 	},
	-- 	coffeesense = {
	-- 		trace = {
	-- 			server = "verbose"
	-- 		},
	-- 		dev = {
	-- 			logLevel = "INFO",
	-- 		},
	-- 	}
	-- },
}

