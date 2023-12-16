local M = {}
local commands = {}

local function execute(cmd)
	if type(cmd) == "function" then
		cmd()
	else
		vim.cmd(cmd)
	end
end

function M.add(cmds)
	cmds = type(cmds[1]) == "table" and cmds or {cmds}
	for _,v in ipairs(cmds) do
		table.insert(commands,v)
	end
	table.sort(commands, function (a, b)
		return a[1] < b[1]
	end)
end

function M.run()
	vim.ui.select(
		commands,
		{
			prompt = "Your wish is my :command",
			format_item = function(item)
				return item[1]
			end,
		},
		function(choice)
			return choice and execute(choice[2])
		end
	)
end

return M -- LoC 65,37,33
