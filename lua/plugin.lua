local packer = require('packer')

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'rose-pine/neovim'
	use 'nvim-tree/nvim-tree.lua'
	use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
	use 'mg979/vim-visual-multi'
    use {'nvim-treesitter/nvim-treesitter'}
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}
end)
