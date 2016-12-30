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

map <Leader>w :w<CR>

map <Leader>t :tabe<Space>
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>- :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>\ :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

map <Leader>z <C-w>\|
map <Leader>zh <C-w>_
map <Leader>0 <C-w>=

map <Leader>] ]m
map <Leader>[ [m

map <Leader>i mmgg=G`m<CR>

" map <Leader>p :set paste<CR><esc>"*]p:set nopaste<CR>
map <Leader>p :set paste<CR>
map <Leader>n :set nopaste<CR>

map <Leader>dr obinding.pry<ESC>:w<CR>
map <Leader>dj odebugger;<ESC>:w<CR>

map <Leader>s :call RunNearestSpec()<CR>
map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

map <Leader>f :Ack!<space>
map <Leader>fw *<C-O>:AckFromSearch!<CR>

map <Leader>x :%s/
map <Leader>h :noh<CR>

map <Leader>a :A<CR>
map <Leader>r :R<CR>

map <Leader>ct :!ctags -R .<CR>
map <Leader>so :source $MYVIMRC<CR>
map <Leader>rn :Rename<Space>
