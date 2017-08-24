nmap 0 ^
nmap j gj
nmap k gk
nmap gb <C-^>
imap jk <esc>

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
map <Leader>b :Gblame<cr>
map <Leader>d orequire 'pry'<cr>binding.pry<esc>:w<cr>
map <Leader>i mmgg=G`m

map <Leader>t :tabe<Space>
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<cr>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<cr>
map <Leader>td :e ~/Documents/daily.md<cr>

map <Leader>zv <C-w>\|
map <Leader>zs <C-w>_
map <Leader>0 <C-w>=

map <Leader>qo :copen<cr>
map <Leader>qc :ccl<cr>

map <Leader>] ]m
map <Leader>[ [m

map <Leader>sp :call RunNearestSpec()<cr>
map <Leader>sf :call RunCurrentSpecFile()<cr>
map <Leader>sl :call RunLastSpec()<cr>
map <Leader>sa :call RunAllSpecs()<cr>

map <Leader>f :Ack!<space>
map <Leader>fw *<C-O>:AckFromSearch!<cr>

map <Leader>x :%s/
map <Leader>h :noh<cr>

map <Leader>a :A<cr>
map <Leader>r :R<cr>
map <Leader>vm :Vmodel<cr>
map <Leader>vc :Vcontroller<cr>
map <Leader>vv :Vview<cr>
map <Leader>vs :vnew db/schema.rb<cr>

map <Leader>ct :!ctags -R .<cr>
map <Leader>rn :Rename<Space>
map <Leader>vi :tabe ~/.vimrc<cr>
map <Leader>so :source $MYVIMRC<cr>

map <Leader>yp :set paste<cr>
map <Leader>np :set nopaste<cr>
