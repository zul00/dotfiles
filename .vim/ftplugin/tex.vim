" @file:    vim.tex
" @author:  Zulkarnaen
" @brief:   Setting for vim filetype. Some setting is following suggestion
" from latex-suite vim plugin.

" Formatting {{{
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
" }}}
set iskeyword+=:
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'
let g:latex_view_general_viewer = 'zathura'
let g:Tex_ViewRule_pdf = 'zathura'
"" Trying to add same for pdfs, hoping that package SynTex is installed
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*'
"
"" Get the correct servername, which should be the filename of the tex file,
"" without the extension.
"" Using the filename, without the extension, not in uppercase though, but
"" that's okay for a servername, it automatically get uppercased
"let theuniqueserv = expand("%:r")
