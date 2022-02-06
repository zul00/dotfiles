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
" NOTE: Fork from original repo 'glepnir'
Plug 'nvim-lualine/lualine.nvim'
Plug 'folke/lsp-colors.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
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
Plug 'junegunn/goyo.vim'
Plug 'szw/vim-maximizer'

"" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'rcarriga/nvim-dap-ui'

" Grammar
Plug 'reedes/vim-lexical'

" Others
Plug 'embear/vim-localvimrc'
Plug 'majutsushi/tagbar'
Plug 'nvim-neorg/neorg'
Plug 'nvim-neorg/neorg-telescope'

" Filetype specific
"" LaTeX
Plug 'lervag/vimtex'
"" Python
Plug 'metakirby5/codi.vim'
"" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'plasticboy/vim-markdown'
"" Ledger - plain text accounting
Plug 'ledger/vim-ledger'

" Nvim specific
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'onsails/lspkind-nvim'
Plug 'folke/lsp-trouble.nvim'

" Testing
Plug 'mickael-menu/zk-nvim'

call plug#end()
"}}}

" Font & Colors {{{
syntax on
set cursorline
"set guifont=monospace
set textwidth=99
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
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Telescope buffers<CR>
nnoremap <C-g> :Telescope git_files<CR>

" Search
nnoremap <leader>r :Rg 

" Git
nnoremap <leader>gs :Git<CR>
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

" UltiSnips
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" nvim-dap / debugging
nnoremap <silent> <leader>c :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>C :lua require'dap'.close()<CR>
nnoremap <silent> <leader>p :lua require'dap'.pause()<CR>
nnoremap <silent> <leader>gt :Telescope dap 

nnoremap <silent> <Right> :lua require'dap'.step_over()<CR>
nnoremap <silent> <C-Right> :lua require'dap'.step_into()<CR>
nnoremap <silent> <Left> :lua require'dap'.step_out()<CR>
nnoremap <silent> <C-Up>   :lua require'dap'.up()<CR>
nnoremap <silent> <C-Down> :lua require'dap'.down()<CR>

nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>

nnoremap <silent> <leader>gr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>gl :lua require'dap'.run_last()<CR>
nnoremap <silent> E :lua require('dap.ui.widgets').hover()<CR>


" Others
nnoremap <leader>h :noh<CR>
nnoremap <leader>so :w<CR>:so %<CR>
nnoremap <leader>q :q<CR>
nnoremap <F3> :MaximizerToggle<CR>
nnoremap <F11> :TagbarToggle<CR>
nnoremap <leader>t :Telescope<CR>

nnoremap <leader><leader> :call ToggleQuickfix()<cr>
function! ToggleQuickfix()
  for buffer in tabpagebuflist()
    if bufname(buffer) == ''
      " then it should be the quickfix window
      cclose
      return
    endif
  endfor
  copen
endfunction
" }}}

" Search {{{
set hlsearch
set incsearch
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

" netrw {{{
let g:netrw_liststyle = 3
let g:netrw_winsize = 22
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
