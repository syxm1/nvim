return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,

	opts = {
		flavour = "macchiato",

		background = {
			light = "macchiato",
			dark = "macchiato",
		},

		transparent_background = true,
		show_end_of_buffer = false,
		term_colors = true,

		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = { "bold" },
			keywords = {},
			strings = { "italic" },
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},

		default_integrations = true,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = true,
		},
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
