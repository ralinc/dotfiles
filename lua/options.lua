local o = vim.o
o.autowrite = true
o.breakindent = true
o.completeopt = 'menuone,noselect'
o.cursorline = true
o.diffopt = 'internal,filler,closeoff,vertical'
o.encoding = 'utf-8'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldmethod = 'expr'
o.gdefault = true
o.grepprg = 'ag --nogroup --nocolor'
o.inccommand = 'split'
o.ignorecase = true
o.history = 50
o.listchars = 'tab: » ,trail:·,nbsp:␣'
o.modelines = 0
o.mouse = 'a'
o.scrolloff = 10
o.secure = true
o.shell = '/bin/zsh'
o.shiftround = true
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.showmode = false
o.signcolumn = 'yes'
o.termguicolors = true
o.timeoutlen = 300
o.ttimeoutlen = 100
o.updatetime = 250
o.wildignore = 'tmp/**,log/**'
o.wildmode = 'list:longest,list:full'
o.writebackup = false

local w = vim.wo
w.list = true
w.foldenable = false
w.number = true
w.numberwidth = 5
w.relativenumber = true
w.wrap = false

local b = vim.bo
b.expandtab = true
b.modeline = false
b.shiftwidth = 2
b.softtabstop = 2
b.swapfile = false
b.tabstop = 2
b.textwidth = 120
