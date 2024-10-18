-- Run after install 'make hexokinase'

Plugin {{"https://github.com/RRethy/vim-hexokinase", build = function(dir)
	vim.cmd("!cd "..dir.." && make hexokinase")
end}}

-- 'virtual', 'sign_column', 'background', 'backgroundfull', 'foreground', 'foregroundfull'
vim.g.Hexokinase_highlighters = { 'backgroundfull' }

-- Patterns to match for all filetypes, can be a comma separated string or a list of strings
-- 'full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla', 'colour_names'
vim.g.Hexokinase_optInPatterns = 'full_hex,triple_hex,rgb,rgba,hsl,hsla,colour_names'

-- Filetype specific patterns to match, entry value must be comma seperated list
-- vim.g.Hexokinase_ftOptInPatterns = {
--      css = 'full_hex,rgb,rgba,hsl,hsla,colour_names',
--      html = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
--  }

-- To keep default behaviour don't define this variable
vim.g.Hexokinase_ftEnabled = {"bash", 'css', 'html', 'javascript', "sh", "zsh"}

