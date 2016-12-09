" vim:fdm=marker
" Source = https://dougblack.io/words/a-good-vimrc.html
" http://usevim.com/2012/05/09/clean-vimrc/
"

" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin list
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdtree'
Plugin 'Syntastic'

call vundle#end()            " required
filetype plugin indent on    " required
"}}}

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

" Search {{{
set hlsearch
set incsearch
" }}}

" Others {{{
set lazyredraw
set autoread
" }}}

" Key Remap {{{
nmap <F2> :!%
nmap <F3> :!ipython
nmap <F4> :wa :!ipython -m pdb %
nmap <F5> k:wa :!ipython %
nmap <F6> k:wa :!ipython -i %
nmap <F7> k:SyntasticCheck 
nmap <F8> :!ctags -R .
nmap <F10> :wa:!python setup.py build_ext --inplace
vmap <F11> I#
nmap <F12> :tabe $HOME/.vimrc
vmap <C-c> "*y

" leader map
nmap <leader>so :w:so%
nmap <leader>q :q
nmap <leader>q! :q!
nmap <leader>w :w
nmap <leader>wa :wa
nmap <leader>o :only
nmap <leader>to :tabonly
" }}}
