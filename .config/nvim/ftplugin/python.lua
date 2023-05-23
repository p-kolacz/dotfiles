setlocal.expandtab = false
setlocal.tabstop = 4
setlocal.formatoptions:remove("f")

Helper.map {
	MANUAL     = "https://docs.python.org/3/",
	API        = "https://docs.python.org/3/library/",
	CHEATSHEET = "https://cheatography.com/davechild/cheat-sheets/python/",
}

Laser.start {
	cmd = { "pyright-langserver", "--stdio" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true
			}
		}
	},
}

