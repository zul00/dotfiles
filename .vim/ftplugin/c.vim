" @file:    c.vim
" @author:  Zulkarnaen
" @brief:   Setting for c filetype

" Formatting {{{ 
set shiftwidth=2
set tabstop=2
" }}}

" Key Remap {{{ 
nmap <F4> :!clear<CR><bar>:wa <bar> :make clean<CR>
nmap <F5> :!clear<CR><bar>:wa <bar> :make<CR>
nmap <F6> :!clear<CR><bar>:!./*.bin<CR>
vmap <F9> :normal 0i//<CR>
" }}}

" netrw {{{
let g:netrw_list_hide = 'tags,.git/$,\.o$,\.ko$,\.mod.,\.cmd$,\.symvers$,\.order$,tmp_versions,\.swp'
" }}}

set foldmethod=syntax
let g:load_doxygen_syntax=1
let c_no_comment_fold = 1
