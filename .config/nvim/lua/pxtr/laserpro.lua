local M = { defaults = {} }

function M.logs()
	vim.cmd("tabnew "..vim.lsp.log.get_filename())
end

function M.start(config)
	local cfg = vim.tbl_extend("keep", config, M.defaults)
	cfg.root_dir =
		cfg.root_dir
		or vim.fs.root(0, cfg.root_markers or { ".git" })
		or vim.fn.getcwd()
	return vim.lsp.start(cfg)
end

function M.stop()
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		client:stop()
	end
end

function M.print_name()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	print(#clients > 0 and clients[1].name or "No LS attached")
end

return M
