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
nmap('<leader>t', ':tabnew<CR>')

nmap('<leader>y', '"*y')
nmap('<leader>sp', ':set paste<CR>')
nmap('<leader>np', ':set nopaste<CR>')

nmap('<leader>e', ":e <C-R>=escape(expand(\"%:p:h\"),' ') . '/'<CR>")
nmap('<leader>v', ":vnew <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<CR>")
nmap('<leader>x', ":split <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<CR>")

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
nmap('<leader>fm', tb.keymaps)
nmap('<leader>fo', tb.vim_options)
nmap('<leader>fg', tb.git_commits)
vim.keymap.set('n', '<leader>fn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end)

nmap('<leader>a', ':Ack!<space>')
nmap('<leader>ae', ':Ack! -w<space>')
nmap('<leader>aw', '*<C-O>:AckFromSearch!<CR>')
nmap('<leader>ad', ":Ack! <C-r><C-w> <C-r>=expand('%:h')<CR><CR>")

local ta = require 'nvim-tree.api'
nmap('<leader>o', function()
  ta.tree.toggle { find_file = true }
end)

nmap('<leader>r', ':%s/<C-r><C-w>//gc<Left><Left><Left>')

nmap('<leader>qo', ':copen<CR>')
nmap('<leader>qc', ':cclose<CR>')
nmap('<leader>ql', ':colder<CR>')

nmap('<leader>gb', ':G blame<CR>')
nmap('<leader>gd', ':Gdiff :0<CR>')

nmap('<Leader>ra', ':A<CR>')
nmap('<Leader>rr', ':R<CR>')
nmap('<Leader>em', ':Emodel ')
nmap('<Leader>eg', ':Emigration<CR>')
nmap('<Leader>es', ':Eschema<CR>')
nmap('<Leader>er', ':Einitializer<CR>')
nmap('<Leader>vm', ':Vmodel ')
nmap('<Leader>vs', ':Vschema<CR>')
nmap('<Leader>vr', ':Vinitializer<CR>')

nmap('<leader>ed', ':e Dockerfile<CR>')
nmap('<leader>vd', ':vnew Dockerfile<CR>')

nmap('<leader>md', ':!mkdir -p %:h<CR>')

nmap('<leader>li', ':LspInfo<CR>')
nmap('<leader>le', ':LspStart<CR>')
nmap('<leader>ld', ':LspStop<CR>')

nmap('<leader>nr', ':set norelativenumber<CR>')
nmap('<leader>rn', ':set relativenumber<CR>')

nmap('<leader>so', ':source $MYVIMRC<CR>')

nmap('<leader>pry', 'obinding.pry<esc>:w<CR>')

nmap('<leader>gw', 'gwap')

function _G.rename_file()
  local old_name = vim.fn.expand '%'
  local new_name = vim.fn.input('Name: ', vim.fn.expand '%', 'file')

  if new_name ~= '' and new_name ~= old_name then
    vim.cmd('saveas ' .. new_name)
    vim.fn.system('rm ' .. vim.fn.shellescape(old_name))
    vim.cmd 'redraw!'
  end
end

nmap('<leader>rf', ':lua rename_file()<CR>')

function _G.rspec(run)
  local path = vim.fn.expand '%:p'
  local line = vim.api.nvim_win_get_cursor(0)[1]
  local command

  if run == 'last' then
    command = vim.g.rspec_last_command
  elseif run == 'nearest' then
    command = string.format('bundle exec rspec %s:%d', path, line)
  elseif run == 'file' then
    command = string.format('bundle exec rspec %s', path)
  else
    command = 'bundle exec rspec'
  end

  vim.fn.system(string.format('tmux send-keys -t %s %s C-m', 1, vim.fn.shellescape(command)))

  vim.g.rspec_last_command = command
end

nmap('<leader>sa', ':lua rspec("all")<CR>')
nmap('<leader>sf', ':lua rspec("file")<CR>')
nmap('<leader>sn', ':lua rspec("nearest")<CR>')
nmap('<leader>sl', ':lua rspec("last")<CR>')
