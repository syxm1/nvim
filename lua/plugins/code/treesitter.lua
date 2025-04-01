return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {},
			sync_install = false,
			auto_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = {},
			},

			indent = {
				enable = true,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- Start incremental selection
					node_incremental = "grn", -- Increment selection to next node
					scope_incremental = "grc", -- Increment selection to current scope
					node_decremental = "grm", -- Decrease selection
				},
			},
		})
	end,
}
