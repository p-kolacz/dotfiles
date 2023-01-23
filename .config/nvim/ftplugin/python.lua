setlocal.expandtab = false
setlocal.tabstop = 4
setlocal.formatoptions:remove("f")

Help.setup {
	[Help.Type.MANUAL]     = "https://docs.python.org/3/",
	[Help.Type.API]        = "https://docs.python.org/3/library/",
	[Help.Type.CHEATSHEET] = "https://cheatography.com/davechild/cheat-sheets/python/",
}

LaSerPro.start {
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

