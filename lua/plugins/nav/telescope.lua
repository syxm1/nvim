return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",

		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},

		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			vim.keymap.set("n", "<leader>f", "", { desc = "Telescope" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymap" })
			vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Find String" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
			vim.keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, { desc = "Find Document Symbol" })
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
