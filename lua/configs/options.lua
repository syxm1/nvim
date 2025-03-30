-- Disable Vim's compatibility mode, enabling Neovim-specific features
vim.opt.compatible = false

-- Enable filetype detection, plugins, and automatic indenting based on file type
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

-- 24-bit color
vim.opt.termguicolors = true

-- Line numbers
vim.opt.nu = true

-- Backup and swap files
vim.opt.backup = false
vim.opt.swapfile = false

-- Tabs and indentation
vim.opt.expandtab = true -- Default: use spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0 -- Use value of tabstop
vim.opt.softtabstop = 0 -- Default
vim.opt.smarttab = true -- Optional

-- UI settings
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.showmatch = true
vim.opt.hlsearch = true

vim.opt.hidden = true
