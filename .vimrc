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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin list
"Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'Syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki'
Plugin 'LanguageTool'
Plugin 'itchyny/calendar.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
Plugin 'chriskempson/base16-vim'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-lexical'
Plugin 'blindFS/vim-reveal'
Plugin 'ledger/vim-ledger'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'majutsushi/tagbar'

call vundle#end()            " required
filetype plugin indent on    " required
"}}}

" Font & Colors {{{
syntax on
set guifont=monospace
set colorcolumn=80
set t_Co=256
set background=dark
let base16colorspace=256
colorscheme base16-monokai
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
set ttymouse=xterm2
set mouse=a
" }}}

" Key Remap {{{
" Other key
nmap <F2> :!ctags -R *<CR>
set pastetoggle=<F3>
nmap <F10> :tabe $HOME/.vim/ftplugin<CR>
nmap <F12> :tabe $HOME/.vimrc<CR>
vmap <C-c> "*y
imap jj <ESC>
map <space> <leader>
vmap <space><space> <ESC>

vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+P

" leader map
let mapleader = ','
nmap <leader>dt :windo diffthis<CR>
nmap <leader>o :only<CR>
nmap <leader>q :q<CR>
nmap <leader>q! :q!<CR>
nmap <leader>qa :qa<CR>
nmap <leader>so :w<CR>:so%<CR>
nmap <leader>to :tabonly<CR>
nmap <leader>w :w<CR>
nmap <leader>wa :wa<CR>
nmap <leader>wq :wq<CR>
nmap <leader>h :noh<CR>
if &diff
    nmap <leader>i :set diffopt+=iwhite<CR>
    nmap <leader>i! :set diffopt-=iwhite<CR>
    vmap <leader>g :diffget<CR>
    vmap <leader>p :diffput<CR>
    nmap <leader>u :diffu<CR>
    nmap <leader>o :diffoff<CR>
endif
nmap <leader>gst :Gstatus<CR>
nmap <leader>gwr :Gwrite<CR>
nmap <leader>gvd :Gvdiff<CR>
nmap <leader>glg :Git lg2<CR>
" }}}

" Abbreviation {{{ 
abbrev eplug e ~/.vim/ftplugin/
" }}}

" VimWiki {{{ 
let g:vimwiki_list = [{'path':'~/Dropbox/VimWiki', 'path_html':'~/Dropbox/VimWiki/html'}]
" }}}

" latex-suite {{{
let g:tex_flavor='latex'
" }}}

" {{{ Statusline
set laststatus=2
"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" }}}

" {{{ Syntastic
let g:syntastic_python_python_exec = '/usr/bin/python2'
" }}}

" FileType {{{ 
autocmd BufRead,BufNewFile *.ino set filetype=c 
" }}}

" localvimrc {{{
let g:localvimrc_sandbox = 0
let g:localvimrc_whitelist='.lvimrc'
" }}}

" UltiSnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" :UltiSnipsEdit opens to a split window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips/'
" }}}

" VimDiff {{{
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
" }}}

augroup lexical
  autocmd!
  autocmd FileType tex call lexical#init()
augroup END

tnoremap <Esc> <C-\><C-n>
let g:pencil#wrapModeDefault = 'soft'
