 -- __  __            _       _
-- |  \/  | __ _ _ __| | ____| | _____      ___ __
-- | |\/| |/ _` | '__| |/ / _` |/ _ \ \ /\ / / '_ \
-- | |  | | (_| | |  |   < (_| | (_) \ V  V /| | | |
-- |_|  |_|\__,_|_|  |_|\_\__,_|\___/ \_/\_/ |_| |_|

let.markdown_fenced_languages = { 'gdscript', 'html', 'css', 'php', 'sh', 'vim' }

-- Run code in fences
-- https://github.com/dbridges/vim-markdown-runner

vim.cmd[[hi markdownH1 gui=bold,underline]]
vim.cmd[[hi markdownH2 gui=bold,undercurl]]
