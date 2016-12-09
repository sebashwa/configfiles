set encoding=utf-8
filetype on
let mapleader=','

" Set colorscheme
colorscheme ron

" Highlight searches
set hlsearch

" Write while closing files
set autowrite

" Never wrap lines
set nowrap

" Indenting options
set autoindent
set smartindent
set tabstop=2 softtabstop=2 expandtab shiftwidth=2

" Set chars for spaces
set list listchars=tab:\ \ ,trail:·

" Ignore files
set wildignore+=*/tmp/*,*/vendor/*,*.so,*.swp,*.zip

" Disable swap files
set noswapfile

" Set line numbers
set number
highlight LineNr ctermfg=grey

" Always show status bar
set laststatus=2

" Statusline
set statusline=%<%F\ %m%h%r

" Mappings
map <Leader><CR> :w<CR>
nmap m<CR> :noh<CR>
nnoremap <Space> :e<CR>
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprev<CR>
inoremap kj <Esc>l
inoremap kJ <Esc>l
inoremap Kj <Esc>l
inoremap jj <Esc>l
inoremap jJ <Esc>l
inoremap Jj <Esc>l

" ---------------
" --> PLUGINS <--
" ---------------

call plug#begin('~/.nvim/plugged')

Plug 'kassio/neoterm'

" Misc
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'

" Languages
Plug 'ElmCast/elm-vim'
Plug 'dag/vim2hs'


" Filetree
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
map <Leader>n :NERDTreeToggle<CR>
map <Leader>N :NERDTreeFind<CR>

" Acking
Plug 'mileszs/ack.vim', { 'on': ['Ack'] }
map <Leader>a :Ack 
map <Leader>A :Ack! 

" Fuzzyfind
Plug 'kien/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer'] }
map <Leader>b :CtrlPBuffer<CR>
map <Leader>f :CtrlP<CR>
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|vendor|tmp|node_modules)$'

" Testing
Plug 'janko-m/vim-test'
nmap <silent> <leader>R :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
let test#strategy = "neoterm"
let test#ruby#minitest#executable = 'bundle exec rake'
let g:neoterm_size = 20

call plug#end()
