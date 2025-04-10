return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			notify = true,
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 5,
				},
				presets = {
					operators = true,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			win = {
				title = false,
			},
			layout = {
				width = 15,
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		config = function()
			local wk = require("which-key")

			wk.add({
				-- {}
			})
		end,
	},
}
