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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tommcdo/vim-fubitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" tpope's
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

" Tools
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wakatime/vim-wakatime'
Plug 'sirver/UltiSnips'
Plug 'ntpeters/vim-better-whitespace'

" Grammar
Plug 'reedes/vim-lexical'

" Others
Plug 'embear/vim-localvimrc'
Plug 'majutsushi/tagbar'

" Filetype specific
"" LaTeX
Plug 'lervag/vimtex'
"" Python
Plug 'metakirby5/codi.vim'
"" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Nvim specific
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-trouble.nvim'

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
nnoremap <F11> :TagbarToggle<CR>
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

" localvimrc {{{
let g:localvimrc_sandbox = 0
let g:localvimrc_whitelist='.lvimrc'
" }}}

" Others {{{
set showcmd
set scrolloff=2
set mouse=a
set clipboard+=unnamedplus
" }}}

" LSP {{{
set completeopt=menu,menuone,noselect
" }}}
