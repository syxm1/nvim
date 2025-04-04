return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",

	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-macchiato",
				separator = "",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "Outline" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = "",
						separator = { left = "", right = "" },
						padding = { left = 0, right = 0 },
					},
				},
				lualine_b = {
					{
						"filetype",
						icon_only = true,
						padding = { left = 1, right = 0 },
					},
					{
						"filename",
						padding = { left = 1, right = 1 },
					},
				},
				lualine_c = {
					{
						"branch",
						icon = "",
					},
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
					},
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
						update_in_insert = true,
					},
				},
				lualine_y = {
					{
						"lsp_status",
					},
				},
				lualine_z = {
					{
						"location",
						separator = { left = "", right = " " },
						icon = "",
					},
				},
			},

			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},

			extensions = {},
		})
	end,
}
