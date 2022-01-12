" @file:    c.vim
" @author:  Zulkarnaen
" @brief:   Setting for c filetype
" vim:fdm=marker

" Formatting {{{
set shiftwidth=8
set tabstop=8
set noexpandtab
" }}}

" Key Remap {{{
nmap <F2> :!ctags -R *<CR>:!cscope -Rb<CR> :cscope add cscope.out<CR>
set  pastetoggle=<F3>
"nmap <silent> <F8> :cexpr system('checkpatch.pl --terse --file --no-tree ' . shellescape(expand('%')))<CR>
" }}}

" netrw {{{
let g:netrw_list_hide = 'tags,.git/$,\.o$,\.ko$,\.mod.,\.cmd$,\.symvers$,\.order$,tmp_versions,\.swp'
" }}}

" Fold configuration (tree-sitter) {{{
set foldminlines=3
set foldmethod=expr
set foldlevelstart=99
set foldexpr=nvim_treesitter#foldexpr()
let g:c_no_comment_fold = 1
" }}}

" Treat .h as cpp file
let g:load_doxygen_syntax=1
if exists('g:c_syntax_for_h')
  unlet g:c_syntax_for_h
endif

set tags+=tags;/

" For office related works
"autocmd BufNewFile,BufRead ~/projects/**.[{cpp}h] source ~/.vim/ftplugin/c_twtg.vim

nnoremap <C-s> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
nnoremap E                      :Evaluate<CR>
nnoremap <silent> <leader>bb    :Break<cr>
nnoremap <silent> <leader>bc    :Clear<cr>
nnoremap <silent> <leader>bn    :Next<cr>
