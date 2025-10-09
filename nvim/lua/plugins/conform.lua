return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "golines", "gofmt" },
				templ = { "templ" },
				markdown = { "mdformat" },
				nix = { "nixfmt" },
				sh = { "shfmt" },
				templ = { "templ" },
				typescriptreact = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				javascript = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
			},
		})
	end,
}
