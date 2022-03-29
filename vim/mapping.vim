imap jk <esc>
nmap j gj
nmap k gk
nmap 0 ^

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>
map <C-n>f :NERDTreeFind<CR>

map <C-p> :FZF -m<CR>
map <C-p>r :BTags<CR>
map <C-p>h :History<CR>

imap hh <C-y>,

let mapleader = "\<Space>"

nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>i mmgg=G`m

nmap <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
nmap <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nmap <Leader>h :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

nmap <Leader>zv <C-w>\|
nmap <Leader>zh <C-w>_
nmap <Leader>z0 <C-w>=

nmap <Leader>qo :copen<CR>
nmap <Leader>qc :ccl<CR>

nmap <Leader>gb :G blame<CR>
nmap <Leader>gd :Gdiff :0<CR>

nmap <Leader>] ]m
nmap <Leader>[ [m

nmap <Leader>sp :call RunNearestSpec()<CR>
nmap <Leader>sf :call RunCurrentSpecFile()<CR>
nmap <Leader>sl :call RunLastSpec()<CR>
nmap <Leader>sa :call RunAllSpecs()<CR>

nmap <leader>to :VtrOpenRunner<CR>
nmap <leader>tk :VtrKillRunner<CR>
nmap <leader>tf :VtrFocusRunner<CR>

nmap <Leader>f :Ack!<space>
nmap <Leader>fe :Ack! -w<space>
nmap <Leader>fw *<C-O>:AckFromSearch!<CR>
nmap <Leader>fd :Ack! <C-r><C-w> <C-r>=expand('%:h')<CR><CR>

nmap <Leader>ss :%s/
nmap <Leader>n :noh<CR>

nmap <Leader>a :A<CR>
nmap <Leader>r :R<CR>
nmap <Leader>ec :Econtroller<space>
nmap <Leader>em :Emodel<space>
nmap <Leader>ev :Eview<space>
nmap <Leader>eg :Emigration<CR>
nmap <Leader>er :Einitializer<CR>
nmap <Leader>es :Eschema<CR>
nmap <Leader>vc :Vcontroller<space>
nmap <Leader>vm :Vmodel<space>
nmap <Leader>vv :Vview<space>
nmap <Leader>vr :Vinit<CR>
nmap <Leader>vs :Vschema<CR>

nmap <Leader>bp obinding.pry<esc>:w<CR>

nmap <Leader>rn :Rename<Space>
nmap <Leader>ct :!ctags -R .<CR>
nmap <Leader>so :source $MYVIMRC<CR>
nmap <Leader>md :!mkdir -p %:h<CR>
nmap <Leader>c vapgq

set pastetoggle=<F2>
nmap <Leader>pp :set paste<CR>
nmap <Leader>nn :set nopaste<CR>

nmap <Leader>sw :StripWhitespace<CR>
nmap <Leader>x :ALEFix<CR>

nmap <Leader>pr :exec "VtrSendCommand! python " . expand('%')<CR>
nmap <Leader>pt :exec "VtrSendCommand! pytest " . expand('%')<CR>

nmap <Leader>ed :e Dockerfile<CR>
