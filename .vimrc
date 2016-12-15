" @file: .vimrc
" @author: zulkarnaen
"
" vim:fdm=marker
" Source = https://dougblack.io/words/a-good-vimrc.html
" http://usevim.com/2012/05/09/clean-vimrc/
"

" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin list
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdtree'
Plugin 'Syntastic'
Plugin 'desert256.vim'

call vundle#end()            " required
filetype plugin indent on    " required
"}}}

" Font & Colors {{{
colorscheme desert256
syntax on
set guifont=monospace
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
set showcmd
" }}}

" Key Remap {{{
nmap <F2> :!%<CR>
nmap <F3> :!ipython<CR>
nmap <F4> :wa<CR> :!ipython -m pdb %<CR>
nmap <F5> k:wa<CR> :!ipython %<CR>
nmap <F6> k:wa<CR> :!ipython -i %<CR>
nmap <F7> k:SyntasticCheck<CR> 
nmap <F8> :!ctags -R .<CR>
nmap <F10> :wa<CR>:!python setup.py build_ext --inplace<CR>
vmap <F11> I#
nmap <F12> :tabe $HOME/.vimrc<CR>
vmap <C-c> "*y

" leader map
nmap <leader>o :only<CR>
nmap <leader>q :q<CR>
nmap <leader>q! :q!<CR>
nmap <leader>qa :qa<CR>
nmap <leader>so :w<CR>:so%<CR>
nmap <leader>to :tabonly<CR>
nmap <leader>w :w<CR>
nmap <leader>wa :wa<CR>
nmap <leader>wq :wq<CR>
" }}}
