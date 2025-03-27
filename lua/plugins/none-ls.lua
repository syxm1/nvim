return {
  "nvimtools/none-ls.nvim",
  event = "VimEnter",
  config = function()
    local null = require("null-ls")

    null.setup({
      sources = {
        null.builtins.formatting.stylua,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
