return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		local harpoon = require("harpoon")
		local harpoon_extensions = require("harpoon.extensions")
		local conf = require("telescope.config").values

		harpoon.setup({
			settings = {
				save_on_toggle = false,
				sync_on_ui_close = false,
				key = function()
					return vim.loop.cwd()
				end,
			},
		})

		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

    vim.keymap.set("n", "<leader>h", "", { desc = "Harpoon" })
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add current buffer to the list" })
		vim.keymap.set("n", "<leader>hr", function()
			harpoon:list():remove()
		end, { desc = "Remove current buffer from the list" })
		vim.keymap.set("n", "<leader>hh", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open Harpoon menu list" })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Switch to previous on the list" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Switch to next on the list" })
	end,
}
