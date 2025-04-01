local opt = vim.opt
local cmd = vim.cmd

opt.compatible = false

cmd("filetype plugin indent on")
cmd("syntax enable")

opt.nu = true

opt.backup = false
opt.swapfile = false

opt.tabstop = 2
opt.expandtab = true
opt.smarttab = true
opt.shiftround = true
opt.shiftwidth = 0
opt.softtabstop = 0

opt.termguicolors = true
opt.wrap = false
opt.showmode = false
opt.showmatch = true
opt.hlsearch = true

opt.hidden = true
