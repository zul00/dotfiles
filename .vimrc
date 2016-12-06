" Source = https://dougblack.io/words/a-good-vimrc.html
" http://usevim.com/2012/05/09/clean-vimrc/
"
" Font & Colors {{{
colorscheme desert
syntax on
set guifont=consolas
set colorcolumn=80
" }}}

" Tab {{{
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
" }}}

" Numbering {{{
set number
set relativenumber
set ruler
" }}}

" Menu {{{
set wildmenu
" }}}

" Case {{{
set ignorecase
set smartcase
" }}}

" Others {{{
set lazyredraw
set autoread
" }}}

" Key Remap {{{
nmap <F12> :tabe $HOME/.vimrc
" }}}
