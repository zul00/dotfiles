" @file:    c.vim
" @author:  Zulkarnaen
" @brief:   Setting for c filetype

" Formatting {{{
set shiftwidth=8
set tabstop=8
set noexpandtab
" }}}

" Key Remap {{{
nmap <F2> :!ctags -R *<CR>:!cscope -Rb<CR> :cscope add cscope.out<CR>
set  pastetoggle=<F3>
" nmap <F4> :!clear<CR><bar>:wa <bar> :make clean<CR>
nmap <F5> :!clear<CR><bar>:wa <bar> :make<CR>
"nmap <silent> <F8> :cexpr system('checkpatch.pl --terse --file --no-tree ' . shellescape(expand('%')))<CR>
vmap <F9> :normal 0i//<CR>
nmap <F11> :TagbarToggle<CR>
" }}}

" netrw {{{
let g:netrw_list_hide = 'tags,.git/$,\.o$,\.ko$,\.mod.,\.cmd$,\.symvers$,\.order$,tmp_versions,\.swp'
" }}}

set foldmethod=syntax
let g:load_doxygen_syntax=1
let g:c_syntax_for_h=1
let g:c_no_comment_fold = 1
set tags+=tags;/

" For office related works
autocmd BufNewFile,BufRead ~/projects/**.[{cpp}h] source ~/.vim/ftplugin/c_twtg.vim

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright vertical new
  set filetype=logtalk
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "call setline(1, 'You entered:    ' . a:cmdline)
  "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  "call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
endfunction
