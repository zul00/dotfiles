" @file:    markdown.vim
" @author:  Zulkarnaen
" @brief:   Setting for markdown filetype

" Formatting {{{ 
set shiftwidth=2
set tabstop=2
" }}}

nmap <F4>  :silent !zathura %:r.pdf & <CR>
nmap <F5>  :silent make<CR>
call pencil#init()

" pencil setting {{{
call pencil#init()
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 0
" }}}