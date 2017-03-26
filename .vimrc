" @file: .vimrc
" @author: zulkarnaen
"
" vim:fdm=marker
" Source = https://dougblack.io/words/a-good-vimrc.html
" http://usevim.com/2012/05/09/clean-vimrc/


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
Plugin 'desert256.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki'
Plugin 'vimlatex'

call vundle#end()            " required
filetype plugin indent on    " required
"}}}

" Font & Colors {{{
colorscheme desert256
syntax on
set guifont=consolas
set colorcolumn=80
set t_Co=256
" }}}

" Formatting {{{
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
set scrolloff=2
" }}}

" Key Remap {{{
nmap <F12> :tabe $HOME/.vimrc<CR>
vmap <C-c> "*y

" leader map
nmap <leader>do :diffoff<CR>
nmap <leader>dt :windo diffthis<CR>
nmap <leader>du :diffu<CR>
nmap <leader>g :diffget<CR>
nmap <leader>o :only<CR>
nmap <leader>q :q<CR>
nmap <leader>q! :q!<CR>
nmap <leader>qa :qa<CR>
nmap <leader>so :w<CR>:so%<CR>
nmap <leader>to :tabonly<CR>
nmap <leader>w :w<CR>
nmap <leader>wa :wa<CR>
nmap <leader>wq :wq<CR>
if &diff
    nmap <leader>i :set diffopt+=iwhite<CR>
    nmap <leader>i! :set diffopt-=iwhite<CR>
endif
" }}}

" Abbreviation {{{ 
abbrev eplug e ~/.vim/ftplugin/

" }}}

" VimWiki {{{ 
let g:vimwiki_list = [{'path': '~\Dropbox\VimWiki'}]
"}}}

" FileType {{{ 
autocmd BufRead,BufNewFile *.ino set filetype=c 
" }}}
