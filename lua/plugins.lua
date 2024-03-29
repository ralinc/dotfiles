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
  'slim-template/vim-slim',
  'tpope/vim-fugitive',
  'tpope/vim-rails',
  'tpope/vim-sleuth',
  'tpope/vim-surround',

  {
    'rose-pine/neovim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
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
    opts = {
      formatters_by_ft = {
        css = { 'prettier' },
        go = { 'gofmt', 'goimports' },
        graphql = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
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
        -- scss = { 'prettier' },
        toml = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        -- yaml = { 'prettier' },
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
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func)
            vim.keymap.set('n', keys, func, { buffer = event.buf })
          end

          local builtin = require 'telescope.builtin'

          map(',d', builtin.lsp_definitions)
          map(',t', builtin.lsp_type_definitions)
          map(',i', builtin.lsp_implementations)
          map(',s', vim.lsp.buf.signature_help)
          map(',r', builtin.lsp_references)
          map(',e', vim.lsp.buf.rename)
          map(',h', vim.lsp.buf.hover)
          map(',a', vim.lsp.buf.code_action)
          map(',n', vim.diagnostic.goto_next)
          map(',p', vim.diagnostic.goto_prev)
          map(',q', vim.diagnostic.setloclist)
          map(',o', vim.diagnostic.open_float)
          map(',f', vim.lsp.buf.format)
        end,
      })

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('lsp-start', { clear = true }),
        pattern = 'ruby',
        callback = function()
          vim.lsp.start {
            name = 'rubocop',
            cmd = { 'bundle', 'exec', 'rubocop', '--lsp' },
          }
        end,
      })

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('lsp-format', { clear = true }),
        pattern = '*.rb',
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        eslint = {},
        gopls = {},
        pyright = {},
        tailwindcss = {},
        tsserver = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = { checkThirdParty = false },
              diagnostics = { disable = { 'missing-fields' }, globals = { 'vim' } },
            },
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-k>'] = cmp.mapping.confirm { select = true },
          ['<C-l>'] = cmp.mapping.abort(),
        },
        sources = {
          { name = 'nvim_lsp', keyword_length = 3 },
          { name = 'luasnip' },
          { name = 'path' },
          {
            name = 'buffer',
            keyword_length = 2,
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
        },
      }
    end,
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
          file_ignore_patterns = { 'go.sum', 'go.mod', 'poetry.lock', 'yarn.lock', '^public/', '^vendor/', '^dist/' },
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
}
