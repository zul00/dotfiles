" @file: .vimrc
" @author: zulkarnaen
" vim:fdm=marker
"
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

" Plug {{{
call plug#begin('~/.vim/plugged')
" Style
Plug 'morhetz/gruvbox'

" Git
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" tpope's
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'

" Tools
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
"}}}

" Font & Colors {{{
syntax on
set cursorline
"set guifont=monospace
set colorcolumn=99
set background=dark

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
autocmd vimenter * ++nested colorscheme gruvbox
set termguicolors
" }}}

" Formatting {{{
" Default indentation
set expandtab
set shiftwidth=4
set tabstop=4
set autoindent
set smarttab

" Shows trailing spaces in insert mode
set list
" }}}

" Behavior {{{
" read/write file when switching buffers
set autowrite
set autoread

" Reduce redraw rate while executing macros
set lazyredraw
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

" Key Remap {{{
" Remap leader key
let mapleader = ','

" File
nnoremap <F10> :vsplit $HOME/.vim/ftplugin<CR>
nnoremap <F12> :vsplit $HOME/dotfiles/vim/.vimrc<CR>
nnoremap <F12><F12> :vsplit $HOME/dotfiles/configs/nvim<CR>

" Git
nnoremap <leader>g :Git<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gd :Gvdiffsplit<CR>
nnoremap <leader>gl :GV --all<CR>

" Diffs
nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>db :windo diffthis<CR>
nnoremap <leader>do :diffoff!<CR>
vnoremap <leader>dg :diffget<CR>
vnoremap <leader>dp :diffput<CR>
nnoremap <leader>du :diffu<CR>

" Others
nnoremap <leader>h :noh<CR>
nnoremap <leader>so :w<CR>:so %<CR>
nnoremap <leader>q :q<CR>
" }}}

" Search {{{
set hlsearch
set incsearch
" }}}
"
" {{{ FZF
nnoremap <C-p> :Files<CR>
" }}}

" Swap + Buffer {{{
set noswapfile
set undofile
set undodir=/tmp
" }}}

" Others {{{
set showcmd
set scrolloff=2
set mouse=a
set clipboard+=unnamedplus
" }}}
