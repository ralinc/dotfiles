require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'go',
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
  },
  indent = {
    enable = false,
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
      },
      include_surrounding_whitespace = false,
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [' ]'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [' }'] = '@function.outer',
      },
      goto_previous_start = {
        [' ['] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        [' {'] = '@function.outer',
      },
    },
  },
}
