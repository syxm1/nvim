return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local fortune = require("alpha.fortune")

		local header = {
			"                                                    ",
			"                                                    ",
			"                                                    ",
			"                                                    ",
			"                                                    ",
			"                                                    ",
			"                                                    ",
			"                                                    ",
			"                                                    ",
			"                                                    ",
			" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		}

		local buttons = {
			dashboard.button("e", "  New file", ":ene <BAR>startinsert<CR>"),
			dashboard.button("t", "  Show tree", ":NvimTreeOpen<CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "󰏌  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button(
				"c",
				"  Manage configs",
				":lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim' })<CR>"
			),
			dashboard.button("l", "  Manage plugins", ":Lazy<CR>"),
      dashboard.button("s", "  Manage snippets", ":lua require('telescope.builtin').find_files({ cwd = '~/.config/nvim/lua/snippets' })<CR>"),
			dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
		}

		dashboard.section.header.val = header
		dashboard.section.buttons.val = buttons
		dashboard.section.footer.val = fortune()

		alpha.setup(dashboard.config)

		vim.cmd([[
      autocmd User AlphaReady set laststatus=0 | set noruler
      autocmd BufUnload <buffer> set laststatus=3 | set ruler
    ]])
	end,
}
