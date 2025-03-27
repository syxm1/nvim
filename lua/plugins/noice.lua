return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			local nvim_notify = require("notify")
			nvim_notify.setup({
				nvim_notify._config(),
				background_color = "#000000",
				level = 1,
        fps = 60,
				render = "compact",
				stages = "static",
				time_formats = {
					notification = "%T",
					notification_history = "%FT%T",
				},
				timeout = 2000,
				top_down = true,
			})
      vim.notify = nvim_notify
		end,
	},
}
