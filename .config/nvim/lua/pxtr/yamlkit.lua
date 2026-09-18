local group_id = vim.api.nvim_create_augroup("yamlkit", { clear = true })

local function is_yaml_buffer(bufnr)
	return vim.bo[bufnr or 0].filetype == "yaml"
end

local M = {}

function M.yaml_to_json()
	if not is_yaml_buffer() then
		vim.notify("Not a YAML buffer")
		return
	end

	local input = vim.fn.expand("%:p")
	local output = vim.fn.expand("%:p:r") .. ".json"

	local result = vim.system({ "yq", ".", input }, { text = true }):wait()

	if result.code ~= 0 then
		vim.notify(result.stderr, vim.log.levels.ERROR)
		return
	end

	local f = assert(io.open(output, "w"))
	f:write(result.stdout)
	f:close()

	-- vim.notify("Generated " .. output)
end

function M.generate_json_on_save()
	vim.api.nvim_create_autocmd("BufWritePost", {
		pattern = { "*.yaml", "*.yml" },
		group = group_id,
		callback = M.yaml_to_json,
	})
end

return M
