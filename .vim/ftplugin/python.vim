nmap <F2> :!%<CR>
nmap <F3> :!ipython2<CR>
nmap <F4> :wa<CR> :!python2 -m pdb %<CR>
nmap <F5> k:wa<CR> :!python2 %<CR>
nmap <F6> k:wa<CR> :!python2 -i %<CR>
nmap <F7> k:SyntasticCheck<CR> 
nmap <F8> :!ctags -R .<CR>
nmap <F10> :wa<CR>:!python2 setup.py build_ext --inplace<CR>
vmap <F11> I#
