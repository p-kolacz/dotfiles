Help.map(Help.Type.MANUAL, "https://yaml.org/")
Help.map(Help.Type.CHEATSHEET, "https://devhints.io/yaml")
Help.map(Help.Type.TUTORIAL, "https://www.cloudbees.com/blog/yaml-tutorial-everything-you-need-get-started")
Help.map(Help.Type.CUSTOM1, "https://github.github.io/actions-cheat-sheet/actions-cheat-sheet.pdf")

-- set.foldmethod = "indent"

LaSerPro.start {
	name = "YAML",
	cmd = { "yaml-language-server", "--stdio" },
	settings = {
		redhat = {
			telemetry = {
				enabled = false
			}
		}
	},
}

