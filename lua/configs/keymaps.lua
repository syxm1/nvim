vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "{<CR>", "{<CR>}<Esc>O", { noremap = true, silent = true })
keymap.set("i", "{}", "{}", { noremap = true, silent = true })

keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

keymap.set("n", "<C-l>", "zl", { noremap = true, silent = true })
keymap.set("n", "<C-h>", "zh", { noremap = true, silent = true })
