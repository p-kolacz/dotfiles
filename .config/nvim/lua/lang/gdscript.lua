  -- ____ ____  ____            _       _
 -- / ___|  _ \/ ___|  ___ _ __(_)_ __ | |_
-- | |  _| | | \___ \ / __| '__| | '_ \| __|
-- | |_| | |_| |___) | (__| |  | | |_) | |_
 -- \____|____/|____/ \___|_|  |_| .__/ \__|
  --                             |_|

-- Syntax ---------------------------------------------------------------------

Plugin "https://github.com/habamax/vim-godot"
-- let g:godot_ext_hl=v:true

-- LSPConfig -------------------------------------------------------------------

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#gdscript
require'lspconfig'.gdscript.setup{
	-- cmd = {"gdlog.sh", "localhost", "6008"},
	cmd = {"nc", "localhost", "6008"},

	capabilities = LSP_CAPABILITIES,
	on_attach = LSP_ON_ATTACH,

	-- bug workaround https://github.com/neovim/neovim/issues/12633
	-- shoud work without this in godoot 3.3.4
	-- on_attach = function (client, buffnr)
	-- 	local _notify = client.notify
	-- 	client.notify = function (method, params)
	-- 		if method == 'textDocument/didClose' then
	-- 			return
	-- 		end
	-- 		_notify(method, params)
	-- 	end
	-- 	LSP_ON_ATTACH(client, buffnr)
	-- end
}

