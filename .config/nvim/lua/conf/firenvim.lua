if not vim.g.started_by_firenvim then
	NVIM_MODE = "standalone"
	return
end

NVIM_MODE = "firenvim"
require "conf/firenvim"

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

-- vim.opt.guifont = "Ubuntu_Mono:h20"
