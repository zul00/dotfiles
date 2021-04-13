" @file:    vim.tex
" @author:  Zulkarnaen
" @brief:   Setting for vim filetype. Some setting is following suggestion
" from latex-suite vim plugin.

" Formatting {{{
set noexpandtab
set shiftwidth=4
set tabstop=4
set autoindent
" }}}

" Key Remap {{{
nmap <F3> :VimtexTocToggle<CR>
nmap <F4> :VimtexClean<CR>
nmap <F5> :VimtexCompile<CR>
nmap <F6> :VimtexView<CR>
vmap <F9> :normal 0i%<CR>
" }}}

" netrw {{{
let g:netrw_list_hide = '\.pdf,\.aux,\.fls,\.log,\.toc,\.out,\.synctex.gz,\.fdb_latexmk,.git/$,\.swp,\.bcf,\.nav,\.snm,\.blg'
" }}}

" vimtex setting {{{
let g:vimtex_view_method = 'zathura'
let g:vimtex_latexmk_progname= '/usr/bin/nvr'
let g:vimtex_compiler_progname = 'nvr'
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

let g:vimtex_compiler_latexmk = {
			\ 'build_dir' : '',
			\ 'callback' : 1,
			\ 'continuous' : 1,
			\ 'executable' : 'latexmk',
			\ 'hooks' : [],
			\ 'options' : [
			\   '-verbose',
			\   '-file-line-error',
			\   '-synctex=1',
			\   '-interaction=nonstopmode',
			\ ],
			\}
