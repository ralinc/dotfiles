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

vim.g.mapleader = ' '

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

local telescope_builtin = require 'telescope.builtin'
nmap('<C-p>', telescope_builtin.find_files)
nmap('<leader>ff', telescope_builtin.live_grep)
nmap('<leader>fw', telescope_builtin.grep_string)
nmap('<leader>fb', telescope_builtin.buffers)
nmap('<leader>fh', telescope_builtin.help_tags)
nmap('<leader>fd', telescope_builtin.diagnostics)
nmap('<leader>fr', telescope_builtin.lsp_references)
nmap('<leader>fk', telescope_builtin.keymaps)
nmap('<leader>fo', telescope_builtin.vim_options)
nmap('<leader>fg', telescope_builtin.git_commits)

nmap('<leader>a', ':Ack!<space>')
nmap('<leader>ae', ':Ack! -w<space>')
nmap('<leader>aw', '*<C-O>:AckFromSearch!<cr>')
nmap('<leader>ad', ":Ack! <C-r><C-w> <C-r>=expand('%:h')<cr><cr>")

nmap('<leader>tt', ':NvimTreeToggle<cr>')
nmap('<leader>tf', ':NvimTreeFindFile<cr>')

nmap('<leader>r', ':%s/<C-r><C-w>//gc<Left><Left><Left>')

nmap('<leader>qo', ':copen<cr>')
nmap('<leader>qc', ':cclose<cr>')
nmap('<leader>ql', ':colder<cr>')

nmap('<leader>o', ':VtrOpenRunner<cr>')
nmap('<leader>k', ':VtrKillRunner<cr>')
nmap('<leader>z', ':VtrFocusRunner<cr>')

nmap('<leader>gb', ':G blame<cr>')
nmap('<leader>gd', ':Gdiff :0<cr>')

nmap('<leader>sa', ':call RunAllSpecs()<cr>')
nmap('<leader>sf', ':call RunCurrentSpecFile()<cr>')
nmap('<leader>sl', ':call RunLastSpec()<cr>')
nmap('<leader>sn', ':call RunNearestSpec()<cr>')

nmap('<leader>pa', ':exec "VtrSendCommand! pytest"<cr>')
nmap('<leader>pe', ':exec "VtrSendCommand! python " . expand(\'%\')<cr>')
nmap('<leader>pf', ':exec "VtrSendCommand! pytest " . expand(\'%\')<cr>')
nmap('<leader>pn', ':exec "VtrSendCommand! pytest " . expand(\'%\') . ":" . line(\'.\')<cr>')

nmap('<leader>es', ':e db/structure.sql<cr>')
nmap('<leader>vs', ':vnew db/structure.sql<cr>')
nmap('<leader>ed', ':e Dockerfile<cr>')
nmap('<leader>vd', ':vnew Dockerfile<cr>')

nmap('<leader>md', ':!mkdir -p %:h<cr>')

nmap('<leader>ni', ':NullLsInfo<cr>')
nmap('<leader>li', ':LspInfo<cr>')
nmap('<leader>le', ':LspStart<cr>')
nmap('<leader>ld', ':LspStop<cr>')

nmap('<leader>nr', ':set norelativenumber<cr>')
nmap('<leader>rn', ':set relativenumber<cr>')

nmap('<leader>so', ':source ~/.config/nvim/init.lua<cr>')

nmap('<leader>pry', 'obinding.pry<esc>:w<cr>')

nmap('<leader>u', 'gwap')

vim.cmd [[
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
]]

nmap('<leader>rf', ':call RenameFile()<cr>')
