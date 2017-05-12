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

" Folding method
set foldmethod=syntax
set foldnestmax=3
set foldlevelstart=99

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

" Misc
Plug 'kassio/neoterm'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_insert_mode = 0
Plug 'maxbrunsfeld/vim-yankstack'
nmap <Leader>p <Plug>yankstack_substitute_older_paste
nmap <Leader>P <Plug>yankstack_substitute_newer_paste
Plug 'flazz/vim-colorschemes'

" Languages
Plug 'ElmCast/elm-vim'
Plug 'dag/vim2hs'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'fleischie/vim-styled-components'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Vimwiki
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/.notes/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]

" Statusline
Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'seoul256' }

" Filetree
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
map <Leader>n :NERDTreeToggle<CR>
map <Leader>N :NERDTreeFind<CR>


" Fuzzy Find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>g :GFiles?<CR>
map <Leader>a :Ag 
map <Leader>A :Ag! 

" Linting
Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake

" Testing
Plug 'janko-m/vim-test'
nmap <silent> <leader>R :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
nmap <silent> <leader>s :TestSuite<CR>
let test#strategy = "neoterm"
let g:neoterm_size = 20
let test#ruby#minitest#executable = 'bundle exec rake'
let test#javascript#mocha#executable = 'NODE_ENV=test ./node_modules/.bin/mocha src/setup.test.js'
let test#javascript#mocha#options = '--compilers js:babel-register,js:babel-polyfill'
let test#javascript#mocha#file_pattern = '\.test\.js'

call plug#end()

" Set highlighted line style
hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE

