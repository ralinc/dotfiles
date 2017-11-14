imap jk <esc>
nmap j gj
nmap k gk
nmap 0 ^
nmap gb <C-^>

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

map <Leader>q :q<cr>
map <Leader>w :w<cr>
map <Leader>i mmgg=G`m

map <Leader>t :tabe<Space>
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>
map <Leader>h :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>

map <Leader>zv <C-w>\|
map <Leader>zh <C-w>_
map <Leader>z0 <C-w>=

map <Leader>qo :copen<cr>
map <Leader>qc :ccl<cr>

map <Leader>b :Gblame<cr>
map <Leader>d :Gdiff<cr>
map <Leader>ga :Gw<cr>

map <Leader>] ]m
map <Leader>[ [m

map <Leader>sp :call RunNearestSpec()<cr>
map <Leader>sf :call RunCurrentSpecFile()<cr>
map <Leader>sl :call RunLastSpec()<cr>
map <Leader>sa :call RunAllSpecs()<cr>
map <leader>sz :VtrFocusRunner<cr>
map <leader>sc :VtrKillRunner<cr>

map <Leader>f :Ack!<space>
map <Leader>fw *<C-O>:AckFromSearch!<cr>

map <Leader>x :%s/
map <Leader>n :noh<cr>

map <Leader>a :A<cr>
map <Leader>r :R<cr>
map <Leader>ec :Econtroller
map <Leader>em :Emodel
map <Leader>ev :Eview
map <Leader>eg :Emigration<cr>
map <Leader>es :Eschema<cr>
map <Leader>vc :Vcontroller
map <Leader>vm :Vmodel
map <Leader>vv :Vview
map <Leader>vr :Vinit<cr>
map <Leader>vs :Vschema<cr>
map <Leader>bo :Btabedit<space>

nmap <Leader>op obinding.pry<esc>:w<cr>
nmap <Leader>od odebugger;<esc>:w<cr>

nmap <Leader>rn :Rename<Space>
nmap <Leader>ct :!ctags -R .<cr>
nmap <Leader>so :source $MYVIMRC<cr>
nmap <Leader>todo :e ~/Documents/daily.md<cr>
nmap <Leader>pj :%!python -m json.tool<cr>

nmap <Leader>pp :set paste<cr>
nmap <Leader>nn :set nopaste<cr>
