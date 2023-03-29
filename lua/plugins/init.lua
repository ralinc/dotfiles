require 'plugins/packer'

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

require('nvim-tree').setup {
  filters = { dotfiles = true },
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local scr_w = vim.opt.columns:get()
        local scr_h = vim.opt.lines:get()
        local win_w = math.floor(scr_w * 0.5)
        local win_h = math.floor(scr_h * 0.7)
        return {
          border = 'rounded',
          relative = 'editor',
          row = (scr_h - win_h) / 2,
          col = (scr_w - win_w) / 2,
          width = win_w,
          height = win_h,
        }
      end,
    },
  },
}

require('nvim-treesitter.configs').setup {
  endwise = { enable = true },
}

require 'plugins/cmp'
require 'plugins/lspconfig'
require 'plugins/null_ls'
require 'plugins/treesitter'

pcall(require('telescope').load_extension, 'fzf')

vim.g['rspec_command'] = 'VtrSendCommandToRunner! bundle exec rspec {spec}'

vim.g['VtrStripLeadingWhitespace'] = 0
vim.g['VtrClearEmptyLines'] = 0
vim.g['VtrAppendNewline'] = 1
