" vim: foldmethod=marker
" General {{{1
filetype on
autocmd BufNewFile,BufRead *.json.jbuilder set ft=ruby
let mapleader=','
set encoding=utf-8
set termguicolors

" Jump to matching paren after inserting
set showmatch
set matchtime=2

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

" Mappings {{{1
noremap <Leader><CR> :w<CR>
noremap - ddp
noremap _ ddkp
nnoremap m<CR> :noh<CR>
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

" Plugins {{{1
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
nnoremap <Leader>p <Plug>yankstack_substitute_older_paste
nnoremap <Leader>P <Plug>yankstack_substitute_newer_paste


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
let g:lightline = { 'colorscheme': 'gruvbox' }


" Filetree
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>N :NERDTreeFind<CR>


" Fuzzy Find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
noremap <Leader>f :Files<CR>
noremap <Leader>b :Buffers<CR>
noremap <Leader>g :GFiles?<CR>
noremap <Leader>a :Ag<CR>


" Linting
Plug 'neomake/neomake'
let g:neomake_javascript_eslint_exe='./node_modules/.bin/eslint'
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake


" Testing
Plug 'janko-m/vim-test'
nnoremap <silent> <Leader>R :Topen<CR>:TestNearest<CR>
nnoremap <silent> <Leader>r :Topen<CR>:TestFile<CR>
nnoremap <silent> <Leader>s :Topen<CR>:TestSuite<CR>
let test#strategy = "neoterm"

call plug#end()

colorscheme gruvbox
hi Folded ctermfg=245 ctermbg=234 guifg=#928374 guibg=#1d2021
