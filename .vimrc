execute pathogen#infect()
filetype plugin indent on

""""""""""""""""
" DEFAULT STUFF"
""""""""""""""""

" Show wildmenu and list of autocompletion
set wildmenu
set wildmode=list:longest,full

" Show current position
set ruler

" Show info line at the bottom of the screen
set modeline
set ls=2

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" No more annoying swapfiles
set noswapfile

" cache ctrlp on exit
let g:ctrlp_clear_cache_on_exit = 0

" MacOS clipboard = vim clipboard
set clipboard=unnamed

" Show current command
set showcmd

" Make backspace work
set backspace=indent,eol,start

"""""""""""""""
" LOOK & FEEL "
"""""""""""""""

" Set terminal color to 256
set t_Co=256

" Set background color and colorscheme
set background=dark
colorscheme default

" Use syntax highlighting
syntax on

" Use line numbers and highlight them
set number
highlight LineNr cterm=NONE ctermfg=white ctermbg=darkgrey

" Highlight search results
set hlsearch
set incsearch
highlight Search cterm=NONE ctermfg=white ctermbg=darkgrey

" Highlight visual mode selection
highlight Visual cterm=NONE ctermfg=white ctermbg=darkgrey

" Show whitespace and eol
set listchars=trail:·
set list

" Colors for the statusline
hi User1 cterm=NONE ctermbg=blue  ctermfg=black
hi User2 cterm=NONE ctermbg=yellow  ctermfg=black
hi User3 cterm=NONE ctermfg=white  ctermbg=darkgrey
" What is shown on the statusline
set statusline=
set statusline+=%1*\ %<%F\                       "File+path
set statusline+=%2*\ \\\|:%{fugitive#head()}\    "Fugitive git branch
set statusline+=%3*\ %=\ row:%l/%L\ (%03p%%)\    "Rownumber/total (%)
set statusline+=\ col:%03c\                      "Colnr

""""""""""""
" MAPPINGS "
""""""""""""
let mapleader = ","
map <Leader><CR> :w<CR>
map <Leader>a :Ack 
map <Leader>A :Ack! 
map <Leader>T :VroomRunTestFile<CR>
map <Leader>t :VroomRunNearestTest<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>f :CtrlP<CR>
map <CR> :noh<CR>
inoremap kj <Esc>l
inoremap Kj <Esc>l
inoremap kJ <Esc>l
