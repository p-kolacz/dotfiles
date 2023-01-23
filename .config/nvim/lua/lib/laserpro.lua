local M = {
	defaults = {
		root_dir = vim.fn.getcwd()
	}
}

function M.start(config)
	for k,v in pairs(M.defaults) do
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
