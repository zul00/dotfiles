" @file: .vimrc
" @author: zulkarnaen
"
" vim:fdm=marker
" Source = https://dougblack.io/words/a-good-vimrc.html
" http://usevim.com/2012/05/09/clean-vimrc/


" Plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugin list
Plug 'tpope/vim-vinegar'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'
Plug 'embear/vim-localvimrc'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'chriskempson/base16-vim'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'blindFS/vim-reveal'
Plug 'ledger/vim-ledger'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/cscope.vim'
Plug 'jreybert/vimagit'

call plug#end()
"}}}

" Font & Colors {{{
syntax on
set cursorline
set guifont=monospace
set colorcolumn=80
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
set mouse=a
set clipboard=unnamedplus,unnamed
" }}}

" Key Remap {{{
" Other key
set pastetoggle=<F3>
nmap <F10> :tabe $HOME/.vim/ftplugin<CR>
nmap <F12> :tabe $HOME/.vimrc<CR>
vmap <C-c> "*y
imap jj <ESC>
map <space> <leader>
vmap <space><space> <ESC>

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
nmap <leader>glo :GV --all<CR>
nmap <leader>0 :Vex<CR>
nmap <leader>s :split<CR>
nmap <leader>v :vsplit<CR>
nmap <leader>t :tabedit<CR>

" cscope
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>
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
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%{fugitive#statusline()}%=%c,%l/%L\ %P
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

"tnoremap <Esc> <C-\><C-n>
let g:pencil#wrapModeDefault = 'soft'
let g:netrw_liststyle = 3
let g:netrw_winsize = 22
