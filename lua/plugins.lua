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
    'thoughtbot/vim-rspec',
    config = function()
      vim.g.rspec_command = 'VtrSendCommandToRunner! bundle exec rspec {spec}'
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
    'christoomey/vim-tmux-runner',
    config = function()
      vim.g.VtrStripLeadingWhitespace = 0
      vim.g.VtrClearEmptyLines = 0
      vim.g.VtrAppendNewline = 1
    end,
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
    'mhartington/formatter.nvim',
    config = function()
      local util = require 'formatter.util'

      local yarn_prettier = function()
        return {
          exe = 'yarn',
          args = { 'prettier', '--stdin-filepath', util.escape_path(util.get_current_buffer_file_path()) },
          stdin = true,
        }
      end

      require('formatter').setup {
        filetype = {
          go = {
            require('formatter.filetypes.go').gofmt,
            require('formatter.filetypes.go').goimports,
          },
          css = {
            yarn_prettier,
          },
          javascript = {
            require('formatter.filetypes.javascript').prettier,
          },
          json = {
            require('formatter.filetypes.json').prettier,
          },
          lua = {
            require('formatter.filetypes.lua').stylua,
          },
          markdown = {
            require('formatter.filetypes.markdown').prettier,
          },
          python = {
            require('formatter.filetypes.python').black,
            require('formatter.filetypes.python').isort,
          },
          typescript = {
            yarn_prettier,
          },
          typescriptreact = {
            yarn_prettier,
          },
        },
      }
    end,
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
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { 'go.sum', 'go.mod', 'poetry.lock', 'yarn.lock', '^public/', '^vendor/' },
      },
    },
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

-- LSP

local on_attach = function()
  local o = { noremap = true, silent = true, buffer = 0 }

  vim.keymap.set('n', ',d', vim.lsp.buf.definition, o)
  vim.keymap.set('n', ',t', vim.lsp.buf.type_definition, o)
  vim.keymap.set('n', ',i', vim.lsp.buf.implementation, o)
  vim.keymap.set('n', ',s', vim.lsp.buf.signature_help, o)
  vim.keymap.set('n', ',r', require('telescope.builtin').lsp_references, o)
  vim.keymap.set('n', ',e', vim.lsp.buf.rename, o)
  vim.keymap.set('n', ',h', vim.lsp.buf.hover, o)
  vim.keymap.set('n', ',a', vim.lsp.buf.code_action, o)

  vim.keymap.set('n', ',n', vim.diagnostic.goto_next, o)
  vim.keymap.set('n', ',p', vim.diagnostic.goto_prev, o)
  vim.keymap.set('n', ',q', vim.diagnostic.setloclist, o)
  vim.keymap.set('n', ',o', vim.diagnostic.open_float, o)

  vim.keymap.set('n', ',f', vim.lsp.buf.format, o)
end

local servers = {
  eslint = {},
  gopls = {},
  pyright = {},
  tailwindcss = {},
  tsserver = {},
  lua_ls = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local lspconfig = require 'lspconfig'

mason_lspconfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Ruby LSP

vim.opt.signcolumn = 'yes'

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('LspStart', {}),
  pattern = 'ruby',
  callback = function()
    vim.lsp.start {
      name = 'rubocop',
      cmd = { 'bundle', 'exec', 'rubocop', '--lsp' },
    }
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('LspConfig', {}),
  pattern = '*.rb',
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   pattern = '*.rb',
--   callback = on_attach,
-- })

-- Ruby LSP
