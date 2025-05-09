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
			" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		}

		local buttons = {
			dashboard.button("e", "  New file", ":ene<CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "󰏌  Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("l", "  Lazy", ":Lazy<CR>"),
			dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
		}

		dashboard.section.header.val = header
		dashboard.section.buttons.val = buttons
		dashboard.section.footer.val = fortune()

		alpha.setup(dashboard.config)

		vim.keymap.set("n", "<C-a>", ":Alpha<CR>", { noremap = true, silent = true })

		vim.cmd([[
      autocmd User AlphaReady set laststatus=0 | set noruler
      autocmd BufUnload <buffer> set laststatus=3 | set ruler
    ]])
	end,
}
