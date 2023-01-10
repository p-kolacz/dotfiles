local M = {}

M.Type = {
	API        = { "ha", "API" },
	CHEATSHEET = { "hc", "cheat sheet" },
	FUNCTIONS  = { "hf", "functions" },
	FAQ        = { "hq", "FAQ" },
	MANUAL     = { "hm", "manual" },
	STDLIB     = { "hs", "standard library" },
	STYLEGUIDE = { "hg", "style guide" },
	TOOLS      = { "ho", "tools" },
	TUTORIAL   = { "ht", "tutorial" },
	CUSTOM1    = { "h1", "1" },
	CUSTOM2    = { "h2", "2" },
	CUSTOM3    = { "h3", "3" },
}

function M.map(help_type, uri, desc)
	local action = string.format(":silent !xdg-open '%s'<cr>", uri:gsub("#", "\\#"))
	nnoremap_buffer("<leader>"..help_type[1], action, desc or help_type[2])
end

function M.edit_ft_notes()
	vim.cmd(string.format("edit %s/doc/%s.md", vim.fn.stdpath("config"), vim.bo.filetype))
end

function M.search_cword()
	vim.cmd [[silent execute "!xdg-open 'https://www.startpage.com/sp/search?query=" . expand("<cword>") . "'"]]
end

function M.search_selection()
	vim.cmd("visual")
	vim.cmd('normal gvy')
	local selection = vim.fn.getreg(0)
	vim.cmd("silent !xdg-open 'https://www.startpage.com/sp/search?query="..selection.."'")
end

return M

