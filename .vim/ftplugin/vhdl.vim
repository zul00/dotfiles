" @file:    vhdl.tex
" @author:  Zulkarnaen
" @brief:   Setting for vhdl filetype.

" Formatting {{{
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
" }}}

" NerdTree {{{
let NERDTreeIgnore=['\.mpf*', '\.mti', '\.wlf', '\.bak', '\.qpf', '\.qws']
" }}}

" Key Remap {{{
nmap <F4> :!del work\_lock<CR>      " Delete _lock
vmap <F11> :'<,'> normal I--<CR>    " Commenting
" }}}
