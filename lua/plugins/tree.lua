return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	event = "VimEnter",

	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true
	end,

	config = function()
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")
			api.config.mappings.default_on_attach(bufnr)
		end

    vim.keymap.set("n", "<leader>e", ":NvimTreeOpen<CR>", { desc = "Toggle File Tree" })

		require("nvim-tree").setup({
			sort = { sorter = "case_sensitive" },
			view = {
				width = 38,
				side = "right",
			},
			renderer = {
				highlight_opened_files = "all",
				highlight_git = true,
				root_folder_modifier = ":t",
				indent_markers = { enable = true },
				icons = {
					show = { git = true, folder = true, file = true, folder_arrow = true },
					glyphs = {
						default = "",
						symlink = "",
						git = {
							unstaged = "",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "",
							deleted = "",
							ignored = "◌",
						},
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
						},
					},
				},
				group_empty = true,
			},
			filters = { dotfiles = false },
			on_attach = on_attach,
		})
	end,
}
