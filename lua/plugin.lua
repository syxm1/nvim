local packer = require('packer')

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'rose-pine/neovim'
	use 'nvim-tree/nvim-tree.lua'
    use {'nvim-treesitter/nvim-treesitter'}
end)
