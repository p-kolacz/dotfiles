Plugin "https://github.com/nvim-telescope/telescope-file-browser.nvim"

require("telescope").setup {
	extensions = {
		file_browser = {
			theme = "ivy",
			grouped = true,
		}
	}
}
require("telescope").load_extension "file_browser"
