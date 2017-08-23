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
nmap <F6> :!clear<CR><bar>:make run<CR>
vmap <F10> :normal 0i//<CR>
" }}}
