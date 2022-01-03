" @file:    vim.tex
" @author:  Zulkarnaen
" @brief:   Setting for vim filetype. Some setting is following suggestion
" from latex-suite vim plugin.

" Formatting {{{
set expandtab
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
" let g:vimtex_latexmk_progname= '/usr/bin/nvr'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_syntax_enabled = 1
let g:vimtex_fold_enabled = 1
" }}}

" pencil setting {{{
" call pencil#init({'wrap': 'soft'})
"let g:pencil#wrapModeDefault = 'soft'
" let g:pencil#conceallevel = 0
" }}}

" Folding setting {{{
set foldmethod=expr
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

let g:vimtex_grammar_vlty = {'lt_directory': '~/src/LanguageTool-5.3/'}
      let g:vimtex_grammar_vlty = {
            \ 'lt_directory': '~/src/LanguageTool-5.3/',
            \ 'lt_command': '',
            \ 'lt_disable': 'WHITESPACE_RULE',
            \ 'lt_enable': '',
            \ 'lt_disablecategories': '',
            \ 'lt_enablecategories': '',
            \ 'server': 'lt',
            \ 'shell_options': '',
            \ 'show_suggestions': 1,
            \ 'encoding': 'auto',
            \}
set spelllang=en_gb
