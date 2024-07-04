NVIM_MODE = "firenvim"

vim.g.firenvim_config = {
	globalSettings = { alt = "all" },
	localSettings = {
		[".*"] = {
			takeover = "never"
		}
	}
}
Plugin {{"https://github.com/glacambre/firenvim", build = function()
	vim.fn["firenvim#install"](0)
end}}

-- set.guifont = "Ubuntu_Mono:h20"
