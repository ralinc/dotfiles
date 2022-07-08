local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map("n", shortcut, command)
end

local function imap(shortcut, command)
  map("i", shortcut, command)
end

imap("jk", "<esc>")
nmap("j", "gj")
nmap("k", "gk")

map("", "C-j", "C-w>j")
map("", "C-k", "C-w>k")
map("", "C-h", "C-w>h")
map("", "C-l", "C-w>l")

map("", "<C-n>", ":NERDTreeToggle<cr>")
map("", "<C-n>f", ":NERDTreeFind<cr>")

vim.g.mapleader = " "

nmap("<leader>q", ":q<cr>")
nmap("<leader>w", ":w<cr>")

nmap("<leader>c", '"+y')
nmap("<leader>sp", ":set paste<cr>")
nmap("<leader>np", ":set nopaste<cr>")

nmap("<leader>e", ":e <C-R>=escape(expand(\"%:p:h\"),' ') . '/'<cr>")
nmap("<leader>v", ":vnew <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<cr>")
nmap("<leader>x", ":split <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<cr>")

nmap("<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap("<leader>f", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap("<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
nmap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")

nmap("<leader><leader>", "<C-^>")
nmap("<leader>nh", ":noh<cr>")

nmap("<leader>zv", "<C-w>\\|")
nmap("<leader>z0", "<C-w>=")

nmap("<leader>qo", ":copen<cr>")
nmap("<leader>qc", ":ccl<cr>")

nmap("<leader>to", ":VtrOpenRunner<cr>")
nmap("<leader>tk", ":VtrKillRunner<cr>")
nmap("<leader>tf", ":VtrFocusRunner<cr>")

nmap("<leader>b", ":G blame<cr>")
nmap("<leader>d", ":Gdiff :0<cr>")

nmap("<leader>sn", ":call RunNearestSpec()<cr>")
nmap("<leader>sf", ":call RunCurrentSpecFile()<cr>")
nmap("<leader>sl", ":call RunLastSpec()<cr>")
nmap("<leader>sa", ":call RunAllSpecs()<cr>")

nmap("<leader>es", ":e db/structure.sql<cr>")
nmap("<leader>vs", ":vnew db/structure.sql<cr>")
nmap("<leader>ed", ":e Dockerfile<cr>")

nmap("<leader>md", ":!mkdir -p %:h<cr>")

nmap("<leader>wp", "vapgq")

nmap("<leader>li", ":LspInfo<cr>")
nmap("<leader>ni", ":NullLsInfo<cr>")

nmap("<leader>so", ":source ~/.config/nvim/init.vim<cr>")

nmap("<leader>pry", "obinding.pry<esc>:w<cr>")
