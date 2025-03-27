vim.g.mapleader = " "

require("config.lazy")
require("config.autocmd")
require("config.option")
require("config.keymap")

require("lazy").setup("plugins")
