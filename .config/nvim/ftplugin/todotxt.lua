require"trouble".setup {
	position = "left",
	width = 80,
	group = false,
}

local function inbox()
	vim.cmd[[vimgrep /^[^(]/ %]]
	vim.cmd[[Trouble quickfix]]
end

local function asap()
	vim.cmd[[vimgrep /^(A)/ %]]
	vim.cmd[[Trouble quickfix]]
end

local function action()
	vim.cmd[[vimgrep /^([AB])/ %]]
	vim.cmd[[Trouble quickfix]]
end

nnoremap("<localleader>i", inbox, "inbox")
nnoremap("<localleader>a", asap, "ASAP")
nnoremap("<localleader>b", action, "action")
