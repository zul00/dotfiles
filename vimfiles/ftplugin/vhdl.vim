" @file:    vhdl.tex
" @author:  Zulkarnaen
" @brief:   Setting for vhdl filetype. Some setting is following suggestion
" from latex-suite vim plugin.

" Formatting {{{
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
" }}}

" NerdTree {{{
let NERDTreeIgnore=[
      \'\.mpf*', '\.mti', '\.wlf', '\.bak', '\.qpf', '\.qws',
      \ 'db/*', 'output_files/*', 'simulation/*', 'work/*',
      \ '\.qsf']
" }}}

" Key Remap {{{
nmap <F4> :!del work\_lock<CR>      " Delete _lock
vmap <F11> :'<,'> normal I--<CR>    " Commenting
" }}}
