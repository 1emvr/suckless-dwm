-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'BurntSushi/ripgrep'
	use 'nvim-tree/nvim-web-devicons'
	use 'ThePrimeagen/harpoon'
	use 'projekt0n/github-nvim-theme'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end)
