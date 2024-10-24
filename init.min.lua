vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax on'

vim.api.nvim_create_autocmd('FileType', { pattern = 'markdown', command = 'setl spell nolist wrap lbr textwidth=80' })
vim.api.nvim_create_autocmd('FileType', { pattern = 'gitcommit', command = 'setl spell textwidth=72' })

local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { remap = false })
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

imap('jk', '<esc>')
nmap('j', 'gj')
nmap('k', 'gk')
tmap('jk', '<C-\\><C-n>')
tmap('<C-h>', '<C-\\><C-N><C-w>h')
tmap('<C-j>', '<C-\\><C-N><C-w>j')
tmap('<C-k>', '<C-\\><C-N><C-w>k')
tmap('<C-l>', '<C-\\><C-N><C-w>l')
vmap('<C-c>', '"+y')
nmap('<leader>j', 'yyp')
nmap('<leader>k', 'yyP')
nmap('<leader><leader>', '<C-^>')
nmap('<leader><CR>', ':noh<CR>')
nmap('<leader>q', ':q<CR>')
nmap('<leader>w', ':w<CR>')
nmap('<leader>y', '"*y')
nmap('<leader>sp', ':set paste<CR>')
nmap('<leader>np', ':set nopaste<CR>')
nmap('<leader>e', ":e <C-R>=escape(expand(\"%:p:h\"),' ') . '/'<CR>")
nmap('<leader>v', ":vnew <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<CR>")
nmap('<leader>x', ":split <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<CR>")
nmap('<leader>\\', '<C-w>|')
nmap('<leader>=', '<C-w>=')
nmap('<leader>r', ':%s/<C-r><C-w>//gc<Left><Left><Left>')
nmap('<leader>qo', ':copen<CR>')
nmap('<leader>qc', ':cclose<CR>')
nmap('<leader>ql', ':colder<CR>')
nmap('<leader>nr', ':set norelativenumber<CR>')
nmap('<leader>rn', ':set relativenumber<CR>')
nmap('<leader>gw', 'gwap')
nmap('<leader>so', ':source $MYVIMRC<CR>')

vim.o.autowrite = true
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.cursorline = true
vim.o.diffopt = 'internal,filler,closeoff,vertical'
vim.o.encoding = 'utf-8'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldmethod = 'expr'
vim.o.gdefault = true
vim.o.grepprg = 'ag --nogroup --nocolor'
vim.o.inccommand = 'split'
vim.o.ignorecase = true
vim.o.history = 50
vim.o.listchars = 'tab: » ,trail:·,nbsp:␣'
vim.o.modelines = 0
vim.o.mouse = 'a'
vim.o.scrolloff = 10
vim.o.secure = true
vim.o.shell = '/bin/zsh'
vim.o.shiftround = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 100
vim.o.updatetime = 250
vim.o.wildignore = 'tmp/**,log/**'
vim.o.wildmode = 'list:longest,list:full'
vim.o.writebackup = false

vim.wo.list = true
vim.wo.foldenable = false
vim.wo.number = true
vim.wo.numberwidth = 5
vim.wo.relativenumber = true
vim.wo.wrap = false

vim.bo.expandtab = true
vim.bo.modeline = false
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.swapfile = false
vim.bo.tabstop = 2
vim.bo.textwidth = 120
