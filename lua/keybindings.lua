local function map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true })
end

map("i", "jk", "<esc>")
map("n", "j", "gj")
map("n", "k", "gk")

map("", "C-j", "C-w>j")
map("", "C-k", "C-w>k")
map("", "C-h", "C-w>h")
map("", "C-l", "C-w>l")

map("", "<C-n>", ":NERDTreeToggle<cr>")
map("", "<C-n>f", ":NERDTreeFind<cr>")

vim.g.mapleader = " "

map("n", "<leader>q", ":q<cr>")
map("n", "<leader>w", ":w<cr>")

map("n", "<leader>c", '"+y')
map("n", "<leader>sp", ":set paste<cr>")
map("n", "<leader>np", ":set nopaste<cr>")

map("n", "<leader>e", ":e <C-R>=escape(expand(\"%:p:h\"),' ') . '/'<cr>")
map("n", "<leader>v", ":vnew <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<cr>")
map("n", "<leader>x", ":split <C-R>=escape(expand(\"%:p:h\"), ' ') . '/'<cr>")

map("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>f", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fw", "<cmd>lua require('telescope.builtin').grep_string()<cr>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")

map("n", "<leader><leader>", "<C-^>")
map("n", "<leader>nh", ":noh<cr>")

map("n", "<leader>zv", "<C-w>\\|")
map("n", "<leader>z0", "<C-w>=")

map("n", "<leader>qo", ":copen<cr>")
map("n", "<leader>qc", ":ccl<cr>")

map("n", "<leader>to", ":VtrOpenRunner<cr>")
map("n", "<leader>tk", ":VtrKillRunner<cr>")
map("n", "<leader>tf", ":VtrFocusRunner<cr>")

map("n", "<leader>b", ":G blame<cr>")
map("n", "<leader>d", ":Gdiff :0<cr>")

map("n", "<leader>sn", ":call RunNearestSpec()<cr>")
map("n", "<leader>sf", ":call RunCurrentSpecFile()<cr>")
map("n", "<leader>sl", ":call RunLastSpec()<cr>")
map("n", "<leader>sa", ":call RunAllSpecs()<cr>")

map("n", "<leader>es", ":e db/structure.sql<cr>")
map("n", "<leader>vs", ":vnew db/structure.sql<cr>")
map("n", "<leader>ed", ":e Dockerfile<cr>")

map("n", "<leader>md", ":!mkdir -p %:h<cr>")

map("n", "<leader>wp", "vapgq")

map("n", "<leader>li", ":LspInfo<cr>")
map("n", "<leader>ni", ":NullLsInfo<cr>")

map("n", "<leader>so", ":source ~/.config/nvim/init.vim<cr>")

map("n", "<leader>pry", "obinding.pry<esc>:w<cr>")
