vim.lsp.enable({
	"lua_ls",
	"gopls",
	"nil",
	"bash-language-server",
	"templ",
	"tailwind",
	"typescript-language-server",
})

-- Diagnostics
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		header = false,
		border = "rounded",
		source = true,
	},
})
