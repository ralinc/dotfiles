local g = vim.o
g.autowrite = true
g.backup = false
g.breakindent = true
g.completeopt = 'menuone,noselect'
g.diffopt = 'internal,filler,closeoff,vertical'
g.encoding = 'utf-8'
g.gdefault = true
g.grepprg = 'ag --nogroup --nocolor'
g.ignorecase = true
g.history = 50
g.listchars = 'tab:  '
g.modelines = 0
g.scrolloff = 10
g.secure = true
g.shell = '/bin/zsh'
g.shiftround = true
g.smartcase = true
g.splitbelow = true
g.splitright = true
g.termguicolors = true
g.timeoutlen = 500
g.wildignore = 'tmp/**,log/**'
g.wildmode = 'list:longest,list:full'
g.writebackup = false

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
