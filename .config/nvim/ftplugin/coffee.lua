setlocal.expandtab = true
setlocal.shiftwidth = 2

Plugin "https://github.com/kchmck/vim-coffee-script"

Laser.start {
	name = "CoffeeSense",
	cmd = { "coffeesense-language-server", "--stdio" },
	single_file_support = true,
}
