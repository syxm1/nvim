return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    event = "VimEnter",

    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = "VimEnter",

    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.pylyzer.setup({ capabilities = capabilities })
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
          map("<leader>l", "", "Language Server")
          map("<leader>lr", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>lc", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
        end,
      })
    end,
  },
}
