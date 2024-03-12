 -- _____ _       _      _
-- |  ___(_) __ _| | ___| |_
-- | |_  | |/ _` | |/ _ \ __|
-- |  _| | | (_| | |  __/ |_
-- |_|   |_|\__, |_|\___|\__|
 --         |___/

local function figlet(font)
	font = font or "standard"
	vim.cmd(".!figlet -f "..font..[[ | sed 's/ *$//g']])
end

mapgroup('<leader>tf', '+Figlet')
nnoremap("<leader>tff", function() figlet("standard")    end, "standard")
nnoremap("<leader>tfr", function() figlet("rectangles")  end, "rectangles")
nnoremap("<leader>tfs", function() figlet("small")       end, "small")
nnoremap("<leader>tfc", function() figlet("cybermedium") end, "cybermedium")
nnoremap("<leader>tf2", function() figlet("twopoint")    end, "2-point")
nnoremap("<leader>tf3", function() figlet("threepoint")  end, "3-point")

