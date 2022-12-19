require 'plugins/packer'

require('Comment').setup {
  mappings = {
    basic = true,
    extra = false,
    extended = false,
  },
}

require('lualine').setup {
  options = { theme = 'jellybeans' },
}

require('nvim-tree').setup {
  view = {
    adaptive_size = true,
  },
  filters = {
    dotfiles = true,
  },
}

require 'plugins/cmp'
require 'plugins/lspconfig'
require 'plugins/null_ls'
require 'plugins/treesitter'

vim.g['ackprg'] = 'ag --nogroup --nocolor --column'

vim.g['rspec_command'] = 'VtrSendCommandToRunner! bundle exec rspec {spec}'

vim.g['VtrStripLeadingWhitespace'] = 0
vim.g['VtrClearEmptyLines'] = 0
vim.g['VtrAppendNewline'] = 1
