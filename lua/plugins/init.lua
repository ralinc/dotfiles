require 'plugins/lazy'
require 'plugins/copilot'
require 'plugins/cmp'
require 'plugins/formatter'
require 'plugins/lspconfig'
require 'plugins/nvim-tree'
require 'plugins/treesitter'

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { 'go.sum', 'go.mod', 'poetry.lock', 'yarn.lock', '^public/', '^morgue/' },
  },
}
pcall(require('telescope').load_extension, 'fzf')

require('Comment').setup {
  mappings = {
    basic = true,
    extra = false,
    extended = false,
  },
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    component_separators = '|',
    section_separators = '',
  },
}

vim.g['ackprg'] = 'ag --nogroup --nocolor --column'

vim.g['rspec_command'] = 'VtrSendCommandToRunner! bundle exec rspec {spec}'

vim.g['VtrStripLeadingWhitespace'] = 0
vim.g['VtrClearEmptyLines'] = 0
vim.g['VtrAppendNewline'] = 1
