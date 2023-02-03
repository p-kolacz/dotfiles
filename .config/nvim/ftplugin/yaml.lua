Helper.map(Helper.Type.MANUAL, "https://yaml.org/")
Helper.map(Helper.Type.CHEATSHEET, "https://devhints.io/yaml")
Helper.map(Helper.Type.TUTORIAL, "https://www.cloudbees.com/blog/yaml-tutorial-everything-you-need-get-started")
Helper.map(Helper.Type.CUSTOM1, "https://github.github.io/actions-cheat-sheet/actions-cheat-sheet.pdf")

-- set.foldmethod = "indent"

Laser.start {
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

