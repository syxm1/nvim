return {
	"nvim-neo-tree/neo-tree.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	lazy = false,

	opts = {},
	config = function()
		local tree = require("neo-tree")

		tree.setup({
			popup_border_style = "rounded",
			window = {
				position = "float",
				width = 35,
			},
			event_handlers = {
				{
					event = "file_renamed",
					handler = function(args)
						print(args.source, " renamed to ", args.destination)
					end,
				},
				{
					event = "file_moved",
					handler = function(args)
						print(args.source, " moved to ", args.destination)
					end,
				},
			},
		})

		vim.keymap.set("n", "<leader>e", ":Neotree<CR>", {})
	end,
}
