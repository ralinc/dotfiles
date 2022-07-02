"===============================================
" Author: Ralin Chimev [https://ralin.io]
" Source: https://github.com/ralinc/dotfiles
"-----------------------------------------------

syntax on

filetype plugin indent on

colorscheme jellybeans

set autowrite
set backspace=indent,eol,start
set clipboard+=unnamedplus
set colorcolumn=+1
set completeopt=menu,menuone,noselect
set diffopt+=vertical
set encoding=utf-8 nobomb
set expandtab
set gdefault
set grepprg=ag\ --nogroup\ --nocolor
set ignorecase
set history=50
set list listchars=tab:»·,trail:·,nbsp:·
set modelines=0
set nobackup
set nofoldenable
set nomodeline
set noswapfile
set nowrap
set nowritebackup
set number
set numberwidth=5
set re=1
set relativenumber
set scrolloff=10
set secure
set shell=/bin/zsh
set shiftround
set shiftwidth=2
set smartcase
set splitbelow
set splitright
set tabstop=2
set termguicolors
set textwidth=120
set timeoutlen=300
set wildignore+=tmp/**,log/**
set wildmode=list:longest,list:full


packadd minpac
call minpac#init()

call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('christoomey/vim-tmux-runner')
call minpac#add('jose-elias-alvarez/null-ls.nvim')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('neovim/nvim-lspconfig')
call minpac#add('nvim-lua/plenary.nvim')
call minpac#add('hrsh7th/cmp-buffer')
call minpac#add('hrsh7th/cmp-nvim-lsp')
call minpac#add('hrsh7th/cmp-path')
call minpac#add('hrsh7th/nvim-cmp')
call minpac#add('nvim-lualine/lualine.nvim')
call minpac#add('nvim-telescope/telescope.nvim')
call minpac#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
call minpac#add('nanotech/jellybeans.vim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('thoughtbot/vim-rspec')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


let mapleader = " "

imap jk <esc>
nmap j gj
nmap k gk

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <C-n> :NERDTreeToggle<cr>
map <C-n>f :NERDTreeFind<cr>

nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>n :noh<cr>
nnoremap <leader><leader> <C-^>

nnoremap <leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>
nnoremap <leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
nnoremap <leader>x :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>

nnoremap <leader>zv <C-w>\|
nnoremap <leader>z0 <C-w>=

nnoremap <leader>qo :copen<cr>
nnoremap <leader>qc :ccl<cr>

nnoremap <leader>b :G blame<cr>
nnoremap <leader>d :Gdiff :0<cr>

nnoremap <leader>sp :set paste<cr>
nnoremap <leader>np :set nopaste<cr>

nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

nnoremap <leader>to :VtrOpenRunner<cr>
nnoremap <leader>tk :VtrKillRunner<cr>
nnoremap <leader>tf :VtrFocusRunner<cr>

nnoremap <leader>sn :call RunNearestSpec()<cr>
nnoremap <leader>sf :call RunCurrentSpecFile()<cr>
nnoremap <leader>sl :call RunLastSpec()<cr>
nnoremap <leader>sa :call RunAllSpecs()<cr>

nnoremap <leader>es :e db/structure.sql<cr>
nnoremap <leader>vs :vnew db/structure.sql<cr>
nnoremap <leader>ed :e Dockerfile<cr>

nnoremap <leader>md :!mkdir -p %:h<cr>
nnoremap <leader>p obinding.pry<esc>:w<cr>
nnoremap <leader>c vapgq

nnoremap <leader>li :LspInfo<cr>
nnoremap <leader>nls :NullLsInfo<cr>


au BufNewFile,BufRead *.md setlocal filetype=markdown

au FileType markdown setlocal spell nolist wrap lbr textwidth=80
au Filetype gitcommit setlocal spell textwidth=72


let g:NERDTreeWinSize = 50
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules']

let g:rspec_command = "VtrSendCommandToRunner! bundle exec rspec {spec}"

let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

lua << END

require('lualine').setup()

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client)
  local opts = { noremap=true, silent=true, buffer=0 }
  vim.keymap.set('n', 'gl', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', ',a', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', ',d', '<cmd>Telescope diagnostics<cr>', opts)
  vim.keymap.set('n', ',e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', ',f', vim.lsp.buf.formatting, opts)
  vim.keymap.set('n', ',h', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', ',n', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', ',p', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ',q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', ',rf', '<cmd>Telescope lsp_references<cr>', opts)
  vim.keymap.set('n', ',rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', ',s', vim.lsp.buf.signature_help, opts)
end

lspconfig.gopls.setup{
  capabilities = capabilities,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
}
lspconfig.pyright.setup{
  capabilities = capabilities,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
}
lspconfig.solargraph.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}
lspconfig.tsserver.setup{
  capabilities = capabilities,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
}

local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<tab>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

local null_ls = require('null-ls')

null_ls.setup({
  debug = false,
  sources = {
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,

    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,

    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier.with({filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    }}),

    null_ls.builtins.formatting.stylua,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})

END
