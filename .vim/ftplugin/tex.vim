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

" netrw {{{
let g:netrw_list_hide = '\.bak,\.pdf,\.aux,\.fls,\.log,\.toc,\.out,\.synctex.gz,\.fdb_latexmk,.git/$,\.swp'
" }}}

" vimtex setting {{{
let g:vimtex_view_method = 'zathura'
" }}}

" pencil setting {{{
call pencil#init({'wrap': 'soft'})
"let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 0
" }}}

" Folding setting {{{
set foldmethod=marker
" }}}

set iskeyword+=:
set iskeyword+=_
