-- __        __   _     ____
-- \ \      / /__| |__ |  _ \  _____   __
--  \ \ /\ / / _ \ '_ \| | | |/ _ \ \ / /
--   \ V  V /  __/ |_) | |_| |  __/\ V /
--    \_/\_/ \___|_.__/|____/ \___| \_/

-- Czy Emmet potrzebny przy LSP?

vim.cmd("command! -nargs=1 Rsync :!rsync -avz --filter=':- .gitignore' ./ <args>")

local lspconfig = require "lspconfig"

lspconfig.html.setup {
	cmd = { "vscode-html-languageserver", "--stdio" },
	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH,
}

lspconfig.cssls.setup {
	cmd = { "vscode-css-languageserver", "--stdio" },
	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH,
}

lspconfig.tsserver.setup {
	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH,
}

