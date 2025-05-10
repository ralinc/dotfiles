local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  'slim-template/vim-slim',
  'tpope/vim-fugitive',
  'tpope/vim-rails',
  'tpope/vim-sleuth',
  'tpope/vim-surround',

  {
    'davidmh/mdx.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
  },

  {
    'tjdevries/colorbuddy.nvim',
    priority = 1000,
  },

  {
    'nanotech/jellybeans.vim',
    priority = 1000,
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'rose-pine',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      mappings = {
        basic = true,
        extra = false,
        extended = false,
      },
    },
  },

  {
    'mileszs/ack.vim',
    config = function()
      vim.g.ackprg = 'ag --nogroup --nocolor --column'
    end,
  },

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_filetypes = { markdown = false }
      vim.g.copilot_no_tab_map = true
      vim.cmd 'imap <silent><script><expr> <C-o> copilot#Accept("")'
    end,
  },

  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    opts = {
      formatters_by_ft = {
        css = { 'prettier' },
        go = { 'gofmt', 'goimports' },
        graphql = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = function(bufnr)
          if require('conform').get_formatter_info('ruff_format', bufnr).available then
            return { 'ruff_format' }
          else
            return { 'black', 'isort' }
          end
        end,
        sql = { 'sqlfluff' },
        toml = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        xml = { 'xmlformat' },
        yaml = { 'prettier' },
        zsh = { 'beautysh' },
      },
      format_on_save = {
        timeout_ms = 1000,
      },
    },
  },

  {
    'nvim-tree/nvim-tree.lua',
    opts = {
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
    },
  },

  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      keymap = { preset = 'default' },
      appearance = { nerd_font_variant = 'mono' },
      completion = { documentation = { auto_show = false } },
      sources = { default = { 'lsp', 'path', 'buffer' } },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },

  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {
            'go.sum',
            'go.mod',
            'poetry.lock',
            'yarn.lock',
            '^public/',
            '^vendor/',
            '^dist/',
            '^design/',
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-endwise',
    },
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'css',
        'dockerfile',
        'go',
        'graphql',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'ruby',
        'scss',
        'sql',
        'toml',
        'tsx',
        'typescript',
        'yaml',
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['as'] = { query = '@scope', query_group = 'locals' },
          },
          include_surrounding_whitespace = false,
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
          },
          goto_next_end = {
            ['}f'] = '@function.outer',
            ['}c'] = '@class.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[s'] = { query = '@scope', query_group = 'locals' },
          },
        },
      },
    },
  },

  checker = {
    enabled = true,
  },
}
