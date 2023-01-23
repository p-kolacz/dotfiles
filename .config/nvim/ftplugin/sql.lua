LaSerPro.start {
	name = "SQLLS",
	cmd = { "sql-language-server", "up", "--method", "stdio" },
	settings = {
		solargraph = {
			diagnostics = true
		}
	},
}

