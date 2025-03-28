vim.g.mapleader = " "

require("config.lazy")
require("config.autocmd")
require("config.option")
require("config.keymap")

require("lazy").setup("plugins")

-- snippets
require("snippets.c")
require("snippets.cpp")
require("snippets.js")
require("snippets.lua")
require("snippets.rs")
require("snippets.tex")
