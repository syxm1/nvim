return {
	{
		"williamboman/mason.nvim",
		event = "VimEnter",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = "VimEnter",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = "VimEnter",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.pylyzer.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},

	{
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
	},
}
