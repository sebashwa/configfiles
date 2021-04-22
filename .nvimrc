set encoding=utf-8
filetype on
autocmd BufNewFile,BufRead *.json.jbuilder set ft=ruby
let mapleader=','
set termguicolors

" Highlight search results
set hlsearch

" Make it possible to change files without saving prompt
set hidden

" Write while closing files
set autowriteall

" Allow switching to another file without
" warning that the file is not written yet
set hidden

" Split windows in this order
set splitright
set splitbelow

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

" Always show status bar
set laststatus=2

" Statusline
set statusline=%<%F\ %m%h%r

set termguicolors

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

" Colorscheme
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0


" Misc
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mg979/vim-visual-multi'
Plug 'maxbrunsfeld/vim-yankstack'
nmap <Leader>p <Plug>yankstack_substitute_older_paste
nmap <Leader>P <Plug>yankstack_substitute_newer_paste


" Languages
Plug 'elixir-editors/vim-elixir'
let g:elixir_fold = 0

Plug 'mhinz/vim-mix-format'
let g:mix_format_on_save = 1

Plug 'ElmCast/elm-vim'
Plug 'dag/vim2hs'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'mxw/vim-jsx'


" Reusable terminal
Plug 'kassio/neoterm'
let g:neoterm_size = 15
let g:neoterm_autoscroll = 1


" Statusline
Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'gruvbox' }


" Filetree
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
map <Leader>n :NERDTreeToggle<CR>
map <Leader>N :NERDTreeFind<CR>


"Distraction-free writing
Plug 'junegunn/goyo.vim'


" Fuzzy Find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>g :GFiles?<CR>
map <Leader>a :Ag<CR>


" Linting
Plug 'neomake/neomake'
let g:neomake_javascript_eslint_exe='./node_modules/.bin/eslint'
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake


" Testing
Plug 'janko-m/vim-test'
nmap <silent> <Leader>R :Topen<CR>:TestNearest<CR>
nmap <silent> <Leader>r :Topen<CR>:TestFile<CR>
nmap <silent> <Leader>s :Topen<CR>:TestSuite<CR>
let test#strategy = "neoterm"
let test#ruby#minitest#executable = 'bundle exec rake'
let test#javascript#runner#executable = 'NODE_ENV=test ./node_modules/.bin/jest'
let test#javascript#jest#executable = 'NODE_ENV=test ./node_modules/.bin/jest'
let test#javascript#jest#file_pattern = '^.*\.test\.js.*$'
let test#javascript#mocha#executable = 'NODE_ENV=test ./node_modules/.bin/mocha src/setup.test.js'
" let test#javascript#mocha#options = '--compilers js:babel-register,js:babel-polyfill'
" let test#javascript#mocha#file_pattern = '\.test\.js$'

call plug#end()

colorscheme gruvbox
