local packer = require('packer')

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
    use 'catppuccin/nvim'
    use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
end)
