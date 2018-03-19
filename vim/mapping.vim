imap jk <esc>
nmap j gj
nmap k gk
nmap 0 ^

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <C-n> :NERDTreeToggle<cr>
map <C-n>f :NERDTreeFind<cr>

map <C-p> :FZF -m<cr>
map <C-p>r :BTags<cr>
map <C-p>h :History<cr>

imap hh <C-y>,

let mapleader = "\<Space>"

nmap <Leader>q :q<cr>
nmap <Leader>w :w<cr>
nmap <Leader>i mmgg=G`m

nmap <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>
nmap <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <Leader>h :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
nmap <Leader>t :tabe<cr>

nmap <Leader>zv <C-w>\|
nmap <Leader>zh <C-w>_
nmap <Leader>z0 <C-w>=

nmap <Leader>qo :copen<cr>
nmap <Leader>qc :ccl<cr>

nmap <Leader>b :Gblame<cr>
nmap <Leader>d :Gdiff<cr>

nmap <Leader>] ]m
nmap <Leader>[ [m

nmap <Leader>sp :call RunNearestSpec()<cr>
nmap <Leader>sf :call RunCurrentSpecFile()<cr>
nmap <Leader>sl :call RunLastSpec()<cr>
nmap <Leader>sa :call RunAllSpecs()<cr>
nmap <leader>sz :VtrFocusRunner<cr>
nmap <leader>sc :VtrKillRunner<cr>

nmap <Leader>f :Ack!<space>
nmap <Leader>fw *<C-O>:AckFromSearch!<cr>

nmap <Leader>x :%s/
nmap <Leader>n :noh<cr>

nmap <Leader>a :A<cr>
nmap <Leader>r :R<cr>
nmap <Leader>ec :Econtroller
nmap <Leader>em :Emodel
nmap <Leader>ev :Eview
nmap <Leader>eg :Emigration<cr>
nmap <Leader>er :Einitializer<cr>
nmap <Leader>es :Eschema<cr>
nmap <Leader>vc :Vcontroller
nmap <Leader>vm :Vmodel
nmap <Leader>vv :Vview
nmap <Leader>vr :Vinit<cr>
nmap <Leader>vs :Vschema<cr>
nmap <Leader>bo :Btabedit<space>

nmap <Leader>op obinding.pry<esc>:w<cr>
nmap <Leader>od odebugger;<esc>:w<cr>

nmap <Leader>rn :Rename<Space>
nmap <Leader>ct :!ctags -R .<cr>
nmap <Leader>so :source $MYVIMRC<cr>
nmap <Leader>pj :%!python -m json.tool<cr>
nmap <Leader>md :!mkdir -p %:h<cr>

set pastetoggle=<F2>
nmap <Leader>pp :set paste<cr>
nmap <Leader>nn :set nopaste<cr>
