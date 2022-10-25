 -- ____            _
-- | __ )  __ _ ___| |__
-- |  _ \ / _` / __| '_ \
-- | |_) | (_| \__ \ | | |
-- |____/ \__,_|___/_| |_|

require"lspconfig".bashls.setup {
	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH,
}

