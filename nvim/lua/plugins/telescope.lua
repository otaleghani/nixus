return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{
			"<leader><space>",
			function()
				require("telescope.builtin").find_files()
			end,
			mode = "n",
			desc = "Find Files (Root Dir)",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").live_grep()
			end,
			mode = "n",
			desc = "Find Files (Root Dir)",
		},
		{
			"<leader>bb",
			function()
				require("telescope.builtin").buffers()
			end,
			mode = "n",
			desc = "Find open Buffers",
		},
	},
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					theme = "ivy",
					hidden = "true",
				},
			},
			extensions = {
				fzf = {},
			},
		})
	end,
}
