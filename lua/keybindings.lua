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

local tb = require 'telescope.builtin'
nmap('<C-p>', tb.find_files)
nmap('<leader>f', tb.live_grep)
nmap('<leader>fw', tb.grep_string)
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

local ta = require 'nvim-tree.api'
nmap('<leader>o', function()
  ta.tree.toggle { find_file = true }
end)

nmap('<leader>r', ':%s/<C-r><C-w>//gc<Left><Left><Left>')

nmap('<leader>qo', ':copen<cr>')
nmap('<leader>qc', ':cclose<cr>')
nmap('<leader>ql', ':colder<cr>')

nmap('<leader>t', ':VtrOpenRunner<cr>')
nmap('<leader>k', ':VtrKillRunner<cr>')
nmap('<leader>z', ':VtrFocusRunner<cr>')

nmap('<leader>gb', ':G blame<cr>')
nmap('<leader>gd', ':Gdiff :0<cr>')

nmap('<leader>re', ':exec "VtrSendCommand! ruby " . expand(\'%\')<cr>')
nmap('<leader>pe', ':exec "VtrSendCommand! python " . expand(\'%\')<cr>')
nmap('<leader>ge', ':exec "VtrSendCommand! go run " . expand(\'%\')<cr>')

nmap('<leader>sa', ':call RunAllSpecs()<cr>')
nmap('<leader>sf', ':call RunCurrentSpecFile()<cr>')
nmap('<leader>sl', ':call RunLastSpec()<cr>')
nmap('<leader>sn', ':call RunNearestSpec()<cr>')

nmap('<leader>pa', ':exec "VtrSendCommand! pytest"<cr>')
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

nmap('<leader>3', 'gwap')

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

nmap('<leader>vv', function()
  vim.fn.jobstart({ 'go', 'run', vim.api.nvim_buf_get_name(0) }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      if data then
        vim.cmd 'vsplit'
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, data)
        vim.api.nvim_win_set_buf(win, buf)
      end
    end,
  })
end)
