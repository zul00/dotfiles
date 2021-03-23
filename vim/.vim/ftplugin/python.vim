nmap <F2> :!%<CR>
nmap <F3> :!ipython2<CR>
nmap <F4> :wa<CR><bar>:!ipython2 -m pdb %<CR>
nmap <F5> k:wa<CR><bar>:!ipython2 %<CR>
nmap <F6> :wa<CR><bar>:!ipython2 -i %<CR>
nmap <F7> k:SyntasticCheck<CR> 
nmap <F8> :!ctags -R .<CR>
nmap <F9> :wa<CR>:!python2 setup.py build_ext --inplace<CR>
vmap <F11> I#

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

set shiftwidth=2
set tabstop=2
