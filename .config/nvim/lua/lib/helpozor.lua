
local SEARCH_URL = "https://www.startpage.com/sp/search?query="

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
	DOCSEARCH  = { "hk", "documentation search", true },
}

-- TODO: search this with mode detection

local function open_url(url)
	local full = url:gsub("#","\\#"):gsub("%%","\\%%")
	vim.cmd("silent !xdg-open ".. vim.fn.shellescape(full))
end

local M = {}

function M.map(map)
	for type, url in pairs(map) do
		local key, desc, querable = unpack(Types[type])
		key = "<leader>"..key
		if querable then
			vim.keymap.set("n", key, function()
				M.search_cword(url)
			end, { desc = desc, buffer = true })
			vim.keymap.set("x", key, function()
				M.search_selection(url)
			end, { desc = desc, buffer = true })
		else
			vim.keymap.set("n", key, function() open_url(url) end, { desc = desc, buffer = true })
		end
	end
end

function M.edit_ft_notes()
	vim.cmd(string.format("edit %s/doc/%s.md", vim.fn.stdpath("config"), vim.bo.filetype))
end

function M.search_cword(url)
	url = url or SEARCH_URL
	local cword = vim.fn.expand("<cword>")
	open_url(url..cword)
end

function M.search_selection(url)
	url = url or SEARCH_URL
	vim.cmd("visual")
	vim.cmd("normal gvy")
	local selection = vim.fn.getreg(0)
	open_url(url..selection)
end

return M

-- nnoremap("<leader>x", ':call netrw#BrowseX("https://onet.pl", netrw#CheckIfRemote())<cr>')
