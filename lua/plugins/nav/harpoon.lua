return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		local harpoon_extensions = require("harpoon.extensions")

		harpoon.setup({
			settings = {
				save_on_toggle = false,
				sync_on_ui_close = false,
				key = function()
					return vim.loop.cwd()
				end,
			},
		})

		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add current buffer to the list" })
		vim.keymap.set("n", "<leader>hr", function()
			harpoon:list():remove()
		end, { desc = "Remove current buffer from the list" })
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open Harpoon menu list" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Switch to previous on the list" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Switch to next on the list" })
	end,
}
