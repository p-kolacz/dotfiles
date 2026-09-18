local M = {}

local function feed_keys(str)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), "n", false)
end

function M.capitalise_buffer()
	vim.cmd([[%s/\<./\u&/g]])
end

function M.capitalise_line()
	vim.cmd([[s/\<./\u&/g]])
end

-- change cword and press . to repeat change on next, n to goto next
-- ":let @/='\\<'.expand('<cword>').'\\>'<cr>cgn"
function M.change_repeat_cword()

	local cword = vim.fn.expand("<cword>")      -- Get the word under the cursor
	vim.fn.setreg("/", "\\<" .. cword .. "\\>") -- Set the search register with word boundaries
	feed_keys("cgn")                            -- Start change on next match
end

-- change visual selection and press . to repeat change on next, n to goto next
-- "\"sy:let @/=@s<cr>cgn"
function M.change_repeat_visual()

	vim.cmd('normal! "sy')                   -- Yank selected text into 's' register
	vim.fn.setreg("/", vim.fn.getreg("s"))   -- Set search register to the contents of register 's'
	feed_keys("cgn")                         -- Start change on next match
end

function M.move_line_down()
	vim.cmd("move .+1")
	vim.cmd("normal! ==")
end

function M.move_line_up()
	vim.cmd("move .-2")
	vim.cmd("normal! ==")
end

function M.remove_trailing_spaces()
	vim.cmd([[%s/\s\+$//e]])
end

function M.reverse_lines()
	vim.cmd("g/^/m0")
end

function M.slash2unicode()
	vim.cmd([[%s/\\\(\x\+\)/\=nr2char('0x'.submatch(1),1)/g]])
end

function M.substitute_cword()
  feed_keys(":%s/<C-R>=expand('<cword>')<CR>//g<left><left>")
end

function M.substitute_input()
	if vim.fn.mode() == "n" then
		feed_keys(":%s/")
	else
		feed_keys(":s/")
	end
end

function M.substitute_selected()
	vim.cmd('normal! "vy')
	local selection = vim.fn.getreg('"')
	feed_keys(":s/" .. selection .. "//g<left><left>")
end

return M
