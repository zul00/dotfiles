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
"Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'blindFS/vim-reveal'
Plug 'chriskempson/base16-vim'
Plug 'embear/vim-localvimrc'
Plug 'itchyny/calendar.vim'
Plug 'jreybert/vimagit'
Plug 'jsfaint/gen_tags.vim'
Plug 'junegunn/gv.vim'
Plug 'ledger/vim-ledger'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-pencil'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/cscope.vim'
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


call plug#end()
"}}}

" Font & Colors {{{
syntax on
set cursorline
set guifont=monospace
set colorcolumn=79
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
nmap <leader>- :NERDTreeToggle<CR>

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

" {{{ Syntastic
"let g:syntastic_python_python_exec = '/usr/bin/python2'
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
"let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" :UltiSnipsEdit opens to a split window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips/'
" }}}

" VimDiff {{{
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
" }}}

" {{{ COC
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""""

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E:' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W:' . info['warning'])
  endif
  "return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
  return join(msgs, ' ') 
endfunction

let g:coc_global_extensions=[
            \ 'coc-git',
            \ 'coc-json', 
            \ 'coc-markdownlint',
            \ 'coc-python',
            \ 'coc-yaml', 
            \ ]

"nmap <silent> gd <Plug>(coc-definition)
" }}}


" {{{ FZF
nnoremap <C-p> :Files<CR>
" }}}


" {{{ Statusline
set laststatus=2
set statusline=%<%f\ %h%m%r%y%{FugitiveStatusline()}%=%{StatusDiagnostic()}%=%-14.(%l,%c%V%)\ %P
" }}}


augroup lexical
  autocmd!
  autocmd FileType tex call lexical#init()
augroup END

"tnoremap <Esc> <C-\><C-n>
let g:pencil#wrapModeDefault = 'soft'
let g:netrw_liststyle = 3
let g:netrw_winsize = 22
