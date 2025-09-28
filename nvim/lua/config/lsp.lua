vim.lsp.enable({
	"lua_ls",
	"gopls",
	"nil",
})

-- Diagnostics
vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
})
