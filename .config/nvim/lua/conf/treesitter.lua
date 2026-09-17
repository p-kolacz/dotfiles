Plugin {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	-- "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	"https://github.com/nvim-treesitter/nvim-treesitter-context",
}

Perun {
	{ "  TS: Update",  "TSUpdate"  },
}

require("nvim-treesitter.install").install {
	"lua",
	"awk", "bash", "regex",
	"ruby", "embedded_template", "sql",
	"html", "css", "scss", "javascript", "nginx",
	"comment", "make",
	"markdown", "markdown_inline",
	"csv", "json", "toml", "xml", "yaml",
	"gdscript", "gdshader", "go", "php", "python", "rust",
	"sxhkdrc", "xresources",
	"todotxt",
}

vim.treesitter.language.register("gdshader", "gsl")
vim.treesitter.language.register("sxhkdrc", "sxhkd")
vim.treesitter.language.register("csv", "csv_semicolon")

-- On `main` there is no configs.setup: highlighting and folds are started
-- per buffer. Filetypes with no installed parser fall through untouched,
-- so this is safe to run for everything.
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if not lang or not pcall(vim.treesitter.start, ev.buf, lang) then
			return
		end

		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr   = "v:lua.vim.treesitter.foldexpr()"

		-- treesitter indentation (opt-in; ruby indents.scm is decent but
		-- occasionally worse than the builtin ftplugin)
		-- vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
