local M = {}

local Types = {
	API        = { "ha", "API" },
	CHEATSHEET = { "hc", "cheat sheet" },
	FUNCTIONS  = { "hf", "functions" },
	FAQ        = { "hq", "FAQ" },
	MANUAL     = { "hm", "manual" },
	STDLIB     = { "hs", "standard library" },
	STYLEGUIDE = { "hg", "style guide" },
	TOOLS      = { "ho", "tools" },
	TUTORIAL   = { "ht", "tutorial" },
	WIKI       = { "hw", "wiki" },
	CUSTOM1    = { "h1", "1" },
	CUSTOM2    = { "h2", "2" },
	CUSTOM3    = { "h3", "3" },
}

-- TODO: search in manual/api/etc
-- TODO: create opener module

function M.map(map)
	for type, url in pairs(map) do
		local action = ":silent !xdg-open "..url:gsub("#", "\\#").."<cr>"
		local key, desc = unpack(Types[type])
		vim.keymap.set("n", "<leader>"..key, action, { desc = desc, buffer = true })
	end
end

function M.edit_ft_notes()
	vim.cmd(string.format("edit %s/doc/%s.md", vim.fn.stdpath("config"), vim.bo.filetype))
end

function M.search_cword()
	vim.cmd [[silent execute "!xdg-open 'https://www.startpage.com/sp/search?query=" . expand("<cword>") . "'"]]
end

function M.search_selection()
	vim.cmd("visual")
	vim.cmd("normal gvy")
	local selection = vim.fn.getreg(0)
	vim.cmd("silent !xdg-open 'https://www.startpage.com/sp/search?query="..selection.."'")
end

return M

-- nnoremap("<leader>x", ':call netrw#BrowseX("https://onet.pl", netrw#CheckIfRemote())<cr>')
