return {
	"nvimtools/none-ls.nvim",
	event = "VimEnter",
	config = function()
		local null = require("null-ls")

		null.setup({
			sources = {
				null.builtins.formatting.stylua,
				null.builtins.formatting.prettier,
				null.builtins.formatting.black,
				null.builtins.formatting.clang_format,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
