  -- ____  ___
 -- / ___|/ _ \
-- | |  _| | | |
-- | |_| | |_| |
 -- \____|\___/

-- https://github.com/golang/tools/tree/master/gopls

require"lspconfig".gopls.setup {
	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH,
}

