local M = { defaults = {} }

function M.logs()
	vim.cmd("tabnew "..vim.lsp.get_log_path())
end

function M.start(config)
	for k,v in pairs(M.defaults) do
		config[k] = config[k] or v
	end
	config.root_dir = config.root_dir or vim.fn.getcwd()
	return vim.lsp.start(config)
end

function M.stop()
	print("Stopping LS...")
	vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = 0 }))
end

function M.print_name()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	print(#clients > 0 and clients[1].name or "No LS attached")
end

return M
