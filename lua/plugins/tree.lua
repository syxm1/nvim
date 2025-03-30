return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {},
	config = function()
		local tree = require("neo-tree")
		tree.setup({
			window = {
				position = "float",
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree<CR>", {})
	end,
}
