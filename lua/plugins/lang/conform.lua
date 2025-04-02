return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")

		conform.setup({
			-- see: https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				markdown = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 200,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>ff", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 200,
			})
		end, { desc = "Apply formatting" })
	end,
}
