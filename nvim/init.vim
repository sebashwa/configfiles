" vim: foldmethod=marker
" SETTINGS {{{1
" ------------

filetype on
let mapleader=','
let maplocalleader = "\\"
set encoding=utf-8
set termguicolors

" Jump to matching paren after inserting
set showmatch
set matchtime=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Highlight search results
set hlsearch

" Write while closing files
set autowriteall

" Allow switch to other file without 'not written yet' warning
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

" Folding
function! GetFoldText()
  let line = getline(v:foldstart)

  let foldedlinecount = v:foldend - v:foldstart

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 11
  let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
  let fillcharcount = windowwidth - strdisplaywidth(line) - len(foldedlinecount)

  return line . " ... " . foldedlinecount . " lines" . repeat(" ",fillcharcount)

endfunction
set foldtext=GetFoldText()
" Do not open folds when navigating with } or {
set foldopen-=block


" MAPPINGS {{{1
" -------------

" Available keys that I don't use much in normal mode:
" H - jump to top of page
" L - jump to bottom of page
" <bs> - jump to previous char

" Edit or source this file
nnoremap <leader>ec :vsplit $MYVIMRC<cr>
nnoremap <leader>sc :source $MYVIMRC<cr>
" Remove search highlights
nnoremap <leader><cr> :noh<cr>
" Save
nnoremap <cr> :w<cr>
" Toggle current fold
nnoremap <Space> za
" Move lines
noremap - ddp
noremap _ ddkP
" Navigate in quickfix window
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprev<cr>
" Quote visual selection
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
" Exit insert mode quickly
inoremap kj <esc>l
inoremap kJ <esc>l
inoremap Kj <esc>l
inoremap jj <esc>l
inoremap jJ <esc>l
inoremap Jj <esc>l


" PLUGINS {{{1
" ------------

call plug#begin('~/.nvim/plugged')

" Misc
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mg979/vim-visual-multi'
Plug 'maxbrunsfeld/vim-yankstack'
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste


" Couleur
Plug 'morhetz/gruvbox'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'ap/vim-css-color'


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
let g:neoterm_default_mod = "botright"
let g:neoterm_size = "15"
let g:neoterm_autoscroll = "1"


" Statusline
Plug 'itchyny/lightline.vim'
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'


" Filetree
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>N :NERDTreeFind<cr>


" Fuzzyfind
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
noremap <leader>f :Files<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>g :GFiles?<cr>
noremap <leader>a :Ag<cr>


" Linting
Plug 'neomake/neomake'
let g:neomake_javascript_eslint_exe='./node_modules/.bin/eslint'
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake


" Testing
Plug 'janko-m/vim-test'
nnoremap <silent> <leader>R :Topen<cr>:TestNearest<cr>
nnoremap <silent> <leader>r :Topen<cr>:TestFile<cr>
nnoremap <silent> <leader>s :Topen<cr>:TestSuite<cr>
let test#strategy = "neoterm"

call plug#end()

colorscheme gruvbox
hi Folded ctermfg=245 ctermbg=234 guifg=#928374 guibg=#1d2021
