" @file:    ledger.vim
" @author:  Zulkarnaen
" @brief:   Setting for ledger filetype


nmap <F3> <Esc>k:r !date "+\%Y/\%m/\%d"<CR>$
imap <F3> <Esc>k:r !date "+\%Y/\%m/\%d"<CR>$
vmap <F4> :LedgerAlign<CR>


"cnoreabbrev Led     :Shell ledger
cnoreabbrev Lbal    !ledger bal
cnoreabbrev Lreg    !ledger reg -S date
cnoreabbrev Lflow   !ledger bal ^Expenses ^Income --invert
cnoreabbrev Lnet    !ledger bal ^Asset ^Liabilities

if &diff
    set nofoldenable
else
    set fdm=marker
endif

let g:ledger_default_commodity = 'EUR'
let g:ledger_commodity_before = 0
let g:ledger_commodity_sep = ' '
let g:ledger_winpos = 'R'
let g:ledger_extra_options = '--file main.ledger'

" Found it here http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Sh call s:RunShellCommand(<q-args>)
command! -complete=file -nargs=* Led call s:RunShellCommand('ledger '.<q-args>)
function! s:RunShellCommand(cmdline)
  "echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright vertical new
  syntax match Number /-\@1<!\d\+\([,.]\d\+\)\+/
  syntax match Special /-\d\+\([,.]\d\+\)\+/
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "call setline(1, 'You entered:    ' . a:cmdline)
  "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  "call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction