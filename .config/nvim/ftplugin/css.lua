require'lib/caniuse'.setup()

mapgroup("<leader>hu", "+Can I Use")
nnoremap_buffer('<leader>huc', ':CaniuseCword<cr>', 'caniuse cword')
nnoremap_buffer('<leader>huq', ':Caniuse ', 'caniuse query')

Helper.map(Helper.Type.CHEATSHEET, "https://devhints.io/css")
Helper.map(Helper.Type.CUSTOM1, "https://devhints.io/css-flexbox")

Laser.start {
	name = "VSCode CSS LS",
	cmd = { "vscode-css-languageserver", "--stdio" },
	settings = {
		css = { validate = true },
		less = { validate = true },
		scss = { validate = true }
	},
}

