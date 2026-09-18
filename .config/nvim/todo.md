# TODO

- NvimTree sync with tabs

vim.cmd("command! -nargs=1 Rsync :!rsync -avz --filter=':- .gitignore' ./ <args>")


```lua
function Custom_fold_text()
	local line = vim.fn.getline(vim.v.foldstart)
	local lines_count = vim.v.foldend - vim.v.foldstart + 1
	return line .. ' (' .. lines_count .. ' lines) '
end
```
