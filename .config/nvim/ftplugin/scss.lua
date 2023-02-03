Laser.start {
	name = "VSCode CSS LS",
	cmd = { "vscode-css-languageserver", "--stdio" },
	settings = {
		css = { validate = true },
		less = { validate = true },
		scss = { validate = true }
	},
}

