set nocompatible
filetype off
let mapleader=','

call plug#begin('~/.nvim/plugged')

Plug 'slim-template/vim-slim'
Plug 'ngmy/vim-rubocop'
Plug 'kassio/neoterm'
Plug 'tomtom/tcomment_vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
map <Leader>n :NERDTreeToggle<CR>
map <Leader>N :NERDTreeFind<CR>

Plug 'mileszs/ack.vim', { 'on': ['Ack'] }
map <Leader>a :Ack 
map <Leader>A :Ack! 

Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer'] }
map <Leader>b :CtrlPBuffer<CR>
map <Leader>f :CtrlP<CR>
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|vendor|tmp)$'

Plug 'janko-m/vim-test'
nmap <silent> <leader>R :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
let test#strategy = "neoterm"
let test#ruby#minitest#executable = 'bundle exec rake'
let g:neoterm_size = 20

call plug#end()

set hlsearch
set autowrite
set nowrap
set tabstop=2 softtabstop=2 expandtab shiftwidth=2
set list listchars=tab:\ \ ,trail:·
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set noswapfile

set number
highlight LineNr ctermfg=grey

map <Leader><CR> :w<CR>
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprev<CR>
map <CR> :noh<CR>
inoremap kj <Esc>l
inoremap kJ <Esc>l
inoremap Kj <Esc>l
inoremap jj <Esc>l
inoremap jJ <Esc>l
inoremap Jj <Esc>l
