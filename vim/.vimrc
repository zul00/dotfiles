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
Plug 'airblade/vim-gitgutter'
Plug 'blindFS/vim-reveal'
Plug 'chriskempson/base16-vim'
Plug 'embear/vim-localvimrc'
Plug 'itchyny/calendar.vim'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'
Plug 'ledger/vim-ledger'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-pencil'
Plug 'ryanoasis/vim-devicons'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'phleet/vim-mercenary'
Plug 'vim-scripts/cscope.vim'
Plug 'vimwiki/vimwiki'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-clang-format'
Plug 'tommcdo/vim-fubitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'wakatime/vim-wakatime'


call plug#end()
"}}}

" Font & Colors {{{
syntax on
set cursorline
"set guifont=monospace
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
nnoremap <F10> :tabe $HOME/.vim/ftplugin<CR>
nnoremap <F12> :tabe $HOME/.vimrc<CR>
vnoremap <C-c> "*y
inoremap jj <ESC>
inoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
vnoremap <space><space> <ESC>

" leader map
let mapleader = ','
nnoremap <leader>dt :windo diffthis<CR>
nnoremap <leader>do :diffoff!<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>q! :q!<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>so :w<CR>:so%<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wa :wa<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>h :noh<CR>
if &diff
    " TODO: Create a function to toggle it
    nnoremap <leader>i :set diffopt+=iwhite<CR>
    nnoremap <leader>i! :set diffopt-=iwhite<CR>
    vnoremap <leader>g :diffget<CR>
    vnoremap <leader>p :diffput<CR>
    nnoremap <leader>u :diffu<CR>
    nnoremap <leader>o :diffoff<CR>
endif
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gv :Gvdiff<CR>
nnoremap <leader>gl :GV --all<CR>
nnoremap <leader>gb :Git branch --all<CR>
nnoremap <leader>0 :Vex<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>t :tabedit<CR>

" Navigation
nnoremap j gj
nnoremap k gk

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

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" }}}

" {{{ Highlight
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(REVIEW|FIXME|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo
" }}}

" Undo function between termintated vim session
set undofile
set undodir=/tmp

augroup lexical
  autocmd!
  autocmd FileType tex call lexical#init()
augroup END

"tnoremap <Esc> <C-\><C-n>
let g:pencil#wrapModeDefault = 'soft'
let g:netrw_liststyle = 3
let g:netrw_winsize = 22

let g:airline_powerline_fonts = 1

set wildmode=list:longest,full
