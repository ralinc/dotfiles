nmap j gj
nmap k gk
nmap 9 ^
nmap 0 $
imap jk <esc>

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>

map <C-p> :FZF -m<CR>
map <C-p>r :BTags<CR>
map <C-p>h :History<CR>

let mapleader = "\<Space>"

map <Leader>w :w<CR>

map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>h :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

map <Leader>] ]m
map <Leader>[ [m

map <Leader>i mmgg=G`m<CR>
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<CR>

map <Leader>s :call RunNearestSpec()<CR>
map <Leader>sf :call RunCurrentSpecFile()<CR>
map <Leader>sl :call RunLastSpec()<CR>
map <Leader>sa :call RunAllSpecs()<CR>

map <Leader>f :Ack!<space>
map <Leader>fw *<C-O>:AckFromSearch!<CR>
map <Leader>x :%s/

map <Leader>a :A<CR>
map <Leader>r :R<CR>

map <Leader>ct :!ctags -R .<CR>
map <Leader>so :source $MYVIMRC<CR>
