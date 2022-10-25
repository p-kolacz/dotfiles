-- PHPActor

-- require"lspconfig".phpactor.setup {
-- 	capabilities = LSP_CAPABILITIES,
-- 	on_attach = LSP_ON_ATTACH,
-- }

--[[
-- Intelephense
require'lspconfig'.intelephense.setup{
	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH,
	-- initializationOptions = {
	-- 	globalStoragePath = '/home/piotr/.cache/intelephense',
	-- },
}
]]

