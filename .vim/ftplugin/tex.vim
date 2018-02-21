" @file:    vim.tex
" @author:  Zulkarnaen
" @brief:   Setting for vim filetype. Some setting is following suggestion
" from latex-suite vim plugin.

" Formatting {{{
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
" }}}

" Key Remap {{{
vmap <F10> :normal 0i%<CR>
" }}}

" NerdTree {{{
let NERDTreeIgnore=['\.pdf', '\.dvi', '\.snm', '\.nav', '\.aux', '\.gz', '\.log', '\.toc', '\.out', '\.vrb']
" }}}

" vimtex setting {{{
let g:vimtex_view_method = 'zathura'
" }}}

" pencil setting {{{
call pencil#init()
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 0
" }}}

