nmap <F2> :!%<CR>
nmap <F3> :!ipython2<CR>
nmap <F4> :wa<CR><bar>:!ipython2 -m pdb %<CR>
nmap <F5> k:wa<CR><bar>:!ipython2 %<CR>
nmap <F6> :wa<CR><bar>:!ipython2 -i %<CR>
nmap <F7> k:SyntasticCheck<CR> 
nmap <F8> :!ctags -R .<CR>
nmap <F9> :wa<CR>:!python2 setup.py build_ext --inplace<CR>
nmap <F11> :TagbarToggle<CR>

nnoremap <silent> <c-]>         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap E                      :Evaluate<CR>
nnoremap <silent> <leader>lD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>         <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD          <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>lr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>l0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>lW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>ld    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>lq    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

nnoremap <silent>  gr           <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>  <space>e     <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent>  [d           <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent>  ]d           <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent>  <space>q     <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent>  <space>f     <cmd>lua vim.lsp.buf.formatting()<CR>

set shiftwidth=2
set tabstop=2

let test#python#runner = 'pyunit'
set colorcolumn=120
