vim.g.firenvim_config = {
	globalSettings = { alt = "all" },
	localSettings = {
		[".*"] = {
			takeover = "never"
		}
	}
}
Plugin("https://github.com/glacambre/firenvim", function()
	vim.fn["firenvim#install"](0)
end)
NVIM_MODE = "firenvim"
