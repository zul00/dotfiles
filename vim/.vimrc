" @file: .vimrc
" @author: zulkarnaen
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
Plug 'morhetz/gruvbox'
Plug 'embear/vim-localvimrc'
Plug 'itchyny/calendar.vim'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'
Plug 'ledger/vim-ledger'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'metakirby5/codi.vim'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-pencil'
" Plug 'tpope/vim-commentary'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'phleet/vim-mercenary'
Plug 'vim-scripts/cscope.vim'
Plug 'vimwiki/vimwiki'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-clang-format'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'tommcdo/vim-fubitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'wakatime/vim-wakatime'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'sirver/UltiSnips'
Plug 'tools-life/taskwiki'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'


call plug#end()
"}}}

" Font & Colors {{{
syntax on
set cursorline
"set guifont=monospace
set colorcolumn=99
set background=dark
"let base16colorspace=256
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

" Others {{{
set noswapfile
set showcmd
set scrolloff=2
set mouse=a
set clipboard+=unnamedplus
" }}}

" Key Remap {{{
" Other key
set pastetoggle=<F3>
nnoremap <F10> :tabe $HOME/.vim/ftplugin<CR>
nnoremap <F12> :tabe $HOME/dotfiles/vim/.vimrc<CR>
vnoremap <C-c> "*y
inoremap jj <ESC>
inoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
vnoremap <space><space> <ESC>

" leader map
let mapleader = ','
nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>db :windo diffthis<CR>
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
vnoremap <leader>dg :diffget<CR>
vnoremap <leader>dp :diffput<CR>
nnoremap <leader>du :diffu<CR>
nnoremap <leader>dw :call ToggleIgnoreWhiteDiff()<CR>

" Toggle ignore white in diff
let g:diff_ignore_white = 0
function! ToggleIgnoreWhiteDiff()
if g:diff_ignore_white
    let g:diff_ignore_white = 0
    set diffopt-=iwhite
else
    let g:diff_ignore_white = 1
    set diffopt+=iwhite
endif
endfunction


" Git shortcuts
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gS :Telescope git_status<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gv :Gvdiff<CR>
nnoremap <leader>gl :GV --all<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gt :Git tag --list<CR>
nnoremap <leader>0 :Vex<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>t :tabedit<CR>

command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git push' <q-args>
command! -bang -bar -nargs=* Gfetch execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git fetch' <q-args>

" Navigation
nnoremap j gj
nnoremap k gk

" cscope
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>

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

"     " RipGrep FZF wrapper
"     function! RipgrepFzf(query, fullscreen)
"       let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
"       let initial_command = printf(command_fmt, shellescape(a:query))
"       let reload_command = printf(command_fmt, '{q}')
"       let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"       call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
"     endfunction
"
"     command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
"
"     " RG search shortcut
" endif

" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction
"
" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
"command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" if executable('rg')
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --hidden --ignore-case --no-heading --no-ignore-vcs --color=always '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
"   \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
"   \   <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --ignore-dot --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

nnoremap <leader>r :Rg 
" endif

" }}}

" Abbreviation {{{
abbrev eplug e ~/.vim/ftplugin/
" }}}

" VimWiki {{{
let g:vimwiki_list = [{'syntax': 'markdown', 'path':'~/logbooks/vimwiki', 'path_html':'~/logbooks/vimwiki/html'}]
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
" TODO: Remove completely
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

" Disable conceal
set conceallevel=0
" }}}

" {{{ FZF
"nnoremap <C-p> :Telescope fzf_writer files<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :lua require('telescope.builtin.git').files({recurse_submodules=true, show_untracked=false})<CR>

nnoremap <C-b> :Telescope buffers<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>t :Telescope 
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

set wildmode=list:longest,full
