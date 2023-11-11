local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme rose-pine]]
      -- vim.cmd [[colorscheme jellybeans]]
    end,
  },

  'christoomey/vim-tmux-navigator',
  'christoomey/vim-tmux-runner',
  'github/copilot.vim',
  'mhartington/formatter.nvim',
  'mileszs/ack.vim',
  'nanotech/jellybeans.vim',
  'numToStr/Comment.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-tree.lua',
  'slim-template/vim-slim',
  'thoughtbot/vim-rspec',
  'tpope/vim-fugitive',
  'tpope/vim-rails',
  'tpope/vim-sleuth',
  'tpope/vim-surround',

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-endwise',
    },
    build = ':TSUpdate',
  },
}
