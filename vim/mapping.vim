nmap 0 ^
nmap j gj
nmap k gk
nmap gb <C-^>
imap jk <esc>

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

map <Leader>q :q<CR>
map <Leader>w :w<CR>
map <Leader>b :Gblame<CR>
map <Leader>d orequire 'pry'<cr>binding.pry<esc>:w<cr>
map <Leader>i mmgg=G`m

map <Leader>t :tabe<Space>
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>td :e ~/Documents/daily.md<cr>

map <Leader>zv <C-w>\|
map <Leader>zs <C-w>_
map <Leader>0 <C-w>=

map <Leader>qo :copen<cr>
map <Leader>qc :ccl<cr>

map <Leader>] ]m
map <Leader>[ [m

map <Leader>sp :call RunNearestSpec()<CR>
map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

map <Leader>f :Ack!<space>
map <Leader>fw *<C-O>:AckFromSearch!<CR>

map <Leader>x :%s/
map <Leader>h :noh<CR>

map <Leader>a :A<CR>
map <Leader>r :R<CR>
map <Leader>m :Emodel<space>
map <Leader>vm :Vmodel<cr>
map <Leader>vc :Vcontroller<cr>
map <Leader>vv :Vview<cr>
map <Leader>vd :vnew db/schema.rb<cr>

map <Leader>ct :!ctags -R .<CR>

map <Leader>rn :Rename<Space>

map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>so :source $MYVIMRC<CR>

map <Leader>y "*y
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>
