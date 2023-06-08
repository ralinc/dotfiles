vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local o = vim.o
o.autowrite = true
o.backup = false
o.breakindent = true
o.completeopt = 'menuone,noselect'
o.diffopt = 'internal,filler,closeoff,vertical'
o.encoding = 'utf-8'
o.gdefault = true
o.ignorecase = true
o.history = 50
o.listchars = 'tab:  '
o.modelines = 0
o.scrolloff = 10
o.secure = true
o.shiftround = true
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.termguicolors = true
o.timeoutlen = 500
o.wildignore = 'tmp/**,log/**'
o.wildmode = 'list:longest,list:full'
o.writebackup = false

local w = vim.wo
w.list = true
w.foldenable = false
w.number = true
w.numberwidth = 5
w.relativenumber = true
w.signcolumn = 'yes'
w.wrap = false

local b = vim.bo
b.expandtab = true
b.modeline = false
b.shiftwidth = 2
b.softtabstop = 2
b.swapfile = false
b.tabstop = 2
b.textwidth = 120

local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { remap = false })
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

imap('jk', '<esc>')
nmap('j', 'gj')
nmap('k', 'gk')

map('', 'C-j', 'C-w>j')
map('', 'C-k', 'C-w>k')
map('', 'C-h', 'C-w>h')
map('', 'C-l', 'C-w>l')

vmap('<C-c>', '"+y')

nmap('<leader><leader>', '<C-^>')
nmap('<leader><cr>', ':noh<cr>')

nmap('<leader>q', ':q<cr>')
nmap('<leader>w', ':w<cr>')

nmap('<leader>y', '"*y')
nmap('<leader>sp', ':set paste<cr>')
nmap('<leader>np', ':set nopaste<cr>')

nmap('<leader>e', ":e <C-R>=escape(expand(\"%:p:h\"),' ') . '/'<cr>")
nmap('<leader>v', ":vnew <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<cr>")
nmap('<leader>x', ":split <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<cr>")

nmap('<leader>\\', '<C-w>|')
nmap('<leader>=', '<C-w>=')

local tb = require 'telescope.builtin'
nmap('<C-p>', tb.find_files)
nmap('<leader>f', tb.live_grep)
nmap('<leader>fw', tb.grep_string)
vim.keymap.set('n', '<leader>fc', function()
  tb.live_grep { search_dirs = { vim.fn.expand '%:p:h' } }
end)
vim.keymap.set('n', '<leader>fd', function()
  tb.live_grep { search_dirs = { vim.fn.input '> ' } }
end)
nmap('<leader>fb', tb.buffers)
nmap('<leader>fr', tb.lsp_references)
nmap('<leader>fs', tb.treesitter)
nmap('<leader>fe', tb.diagnostics)
nmap('<leader>fh', tb.help_tags)
nmap('<leader>fk', tb.keymaps)
nmap('<leader>fo', tb.vim_options)
nmap('<leader>fg', tb.git_commits)

nmap('<leader>r', ':%s/<C-r><C-w>//gc<Left><Left><Left>')

nmap('<leader>qo', ':copen<cr>')
nmap('<leader>qc', ':cclose<cr>')
nmap('<leader>ql', ':colder<cr>')

nmap('<leader>md', ':!mkdir -p %:h<cr>')

nmap('<leader>ni', ':NullLsInfo<cr>')
nmap('<leader>li', ':LspInfo<cr>')
nmap('<leader>le', ':LspStart<cr>')
nmap('<leader>ld', ':LspStop<cr>')

nmap('<leader>nr', ':set norelativenumber<cr>')
nmap('<leader>rn', ':set relativenumber<cr>')

nmap('<leader>so', ':source ~/.config/nvim/init.lua<cr>')

nmap('<leader>gw', 'gwap')

vim.api.nvim_create_autocmd('FileType', { pattern = '*.md', command = 'setl spell nolist wrap lbr textwidth=80' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'gitcommit', command = 'setl spell textwidth=72' })

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'numToStr/Comment.nvim'
  use 'nvim-lualine/lualine.nvim'
  use { 'rose-pine/neovim', as = 'rose-pine' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

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
}

local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.formatting.stylua.with {
      args = { '--indent-width', '2', '--indent-type', 'Spaces', '-' },
    },
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}

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

vim.cmd.colorscheme 'rose-pine'
