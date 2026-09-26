vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.autowrite = true
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.cursorline = true
vim.o.diffopt = 'internal,filler,closeoff,vertical'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldmethod = 'expr'
vim.o.grepprg = 'rg --vimgrep --smart-case'
vim.o.inccommand = 'split'
vim.o.ignorecase = true
vim.o.listchars = 'tab: » ,trail:·,nbsp:␣'
vim.o.scrolloff = 10
vim.o.shell = '/bin/zsh'
vim.o.shiftround = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 100
vim.o.updatetime = 250
vim.o.wildignore = 'tmp/**,log/**'
vim.o.wildmode = 'list:longest,list:full'
vim.o.writebackup = false

vim.o.list = true
vim.o.foldenable = false
vim.o.number = true
vim.o.numberwidth = 5
vim.o.relativenumber = true
vim.o.wrap = false

vim.o.expandtab = true
vim.o.modeline = false
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.textwidth = 120

vim.filetype.add { extension = { mq5 = 'cpp', mqh = 'cpp', mq4 = 'cpp', slim = 'slim' } }

local group = vim.api.nvim_create_augroup('init.min', { clear = true })
vim.api.nvim_create_autocmd(
  'FileType',
  { group = group, pattern = 'markdown', command = 'setl spell nolist wrap lbr textwidth=80' }
)
vim.api.nvim_create_autocmd('FileType', { group = group, pattern = 'gitcommit', command = 'setl spell textwidth=72' })
vim.api.nvim_create_autocmd(
  'FileType',
  { group = group, pattern = { 'go', 'slim' }, command = 'setl noet ts=2 sw=2 sts=2' }
)
vim.api.nvim_create_autocmd('QuickFixCmdPost', { group = group, pattern = 'grep', command = 'cwindow' })

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('t', 'jk', '<C-\\><C-n>')

vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set('n', '<leader>y', '"*y')
vim.keymap.set('n', '<leader>j', 'yyp')
vim.keymap.set('n', '<leader>k', 'yyP')

vim.keymap.set('n', '<leader><leader>', '<C-^>')
vim.keymap.set('n', '<leader><CR>', ':noh<CR>')

vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')

vim.keymap.set('n', '<leader>e', ":e <C-R>=escape(expand(\"%:p:h\"),' ') . '/'<CR>")
vim.keymap.set('n', '<leader>v', ":vnew <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<CR>")
vim.keymap.set('n', '<leader>x', ":split <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<CR>")

vim.keymap.set('n', '<leader>\\', '<C-w>|')
vim.keymap.set('n', '<leader>=', '<C-w>=')

vim.keymap.set('n', '<leader>a', ':silent grep!<space>')
vim.keymap.set('n', '<leader>ae', ':silent grep! -w<space>')
vim.keymap.set('n', '<leader>aw', '*<C-O>:silent grep! -w <C-r><C-w><CR>')
vim.keymap.set('n', '<leader>ad', ":silent grep! <C-r><C-w> <C-r>=expand('%:h')<CR><CR>")

vim.keymap.set('n', '<leader>/', '/\\<\\><Left><Left>')
vim.keymap.set('n', '<leader>r', ':%s/<C-r><C-w>//gc<Left><Left><Left>')

vim.keymap.set('n', '<leader>qo', ':copen<CR>')
vim.keymap.set('n', '<leader>qc', ':cclose<CR>')
vim.keymap.set('n', '<leader>ql', ':colder<CR>')

vim.keymap.set('n', '<leader>ed', ':e Dockerfile<CR>')
vim.keymap.set('n', '<leader>vd', ':vnew Dockerfile<CR>')

vim.keymap.set('n', '<leader>md', ':!mkdir -p %:h<CR>')
vim.keymap.set('n', '<leader>rf', function()
  local old_name = vim.fn.expand '%'
  local new_name = vim.fn.input('New name: ', old_name, 'file')

  if new_name ~= '' and new_name ~= old_name then
    vim.fn.mkdir(vim.fn.fnamemodify(new_name, ':h'), 'p')
    vim.cmd.saveas(vim.fn.fnameescape(new_name))
    if old_name ~= '' then
      vim.fn.delete(old_name)
      vim.cmd.bwipeout '#'
    end
  end
end)

vim.keymap.set('n', '<leader>nr', ':set norelativenumber<CR>')
vim.keymap.set('n', '<leader>rn', ':set relativenumber<CR>')

vim.keymap.set('n', '<leader>so', ':source $MYVIMRC<CR>')

vim.keymap.set('n', '<leader>pry', 'obinding.pry<esc>:w<CR>')

vim.keymap.set('n', '<leader>gw', 'gwap')
