local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-tmux-runner'
  use 'github/copilot.vim'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use 'mileszs/ack.vim'
  use 'nanotech/jellybeans.vim'
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
  }
  use 'numToStr/Comment.nvim'
  use 'nvim-lualine/lualine.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use 'nvim-tree/nvim-tree.lua'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  use {
    'RRethy/nvim-treesitter-endwise',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use 'slim-template/vim-slim'
  use 'thoughtbot/vim-rspec'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rails'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'
  use 'wbthomason/packer.nvim'

  if is_bootstrap then
    require('packer').sync()
  end
end)

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
