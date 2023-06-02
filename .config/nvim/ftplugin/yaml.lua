Helper.map {
	MANUAL     = "https://yaml.org/",
	CHEATSHEET = "https://devhints.io/yaml",
	TUTORIAL   = "https://www.cloudbees.com/blog/yaml-tutorial-everything-you-need-get-started",
	CUSTOM1    = "https://github.github.io/actions-cheat-sheet/actions-cheat-sheet.pdf",
}

Laser.start {
	name = "YAML",
	cmd = { "yaml-language-server", "--stdio" },
	settings = {
		yaml = {
			keyOrdering = false,
		},
		redhat = {
			telemetry = {
				enabled = false
			}
		}
	},
}

