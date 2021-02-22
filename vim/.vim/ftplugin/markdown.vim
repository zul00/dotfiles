" @file:    markdown.vim
" @author:  Zulkarnaen
" @brief:   Setting for markdown filetype

" Formatting {{{ 
set shiftwidth=2
set tabstop=2
" }}}

nmap <F4>  :silent !zathura %:r.pdf & <CR>

" pencil setting {{{
call pencil#init({'wrap': 'soft'})
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 0
" }}}
