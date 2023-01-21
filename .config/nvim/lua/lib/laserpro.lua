local M = {}

local defaults = {
	root_dir = vim.fn.getcwd()
}

function M.setup(on_attach, capabilities)
	defaults.on_attach = on_attach
	defaults.capabilities = capabilities
end

function M.attach(config)
	for k,v in pairs(defaults) do
		config[k] = config[k] or v
	end
	return vim.lsp.start(config)
end

function M.stop()
	vim.lsp.stop_client(vim.lsp.get_active_clients({ bufnr = 0 }))
end

function M.restart()
	M.stop()
	vim.cmd("edit")
end

function M.print_name()
	local clients = vim.lsp.get_active_clients({ bufnr = 0 })
	print(#clients > 0 and clients[1].name or "No LS attached")
end

return M
