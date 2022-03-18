nmap <F2> :!%<CR>
nmap <F3> :!ipython2<CR>
nmap <F4> :wa<CR><bar>:!ipython2 -m pdb %<CR>
nmap <F5> k:wa<CR><bar>:!ipython2 %<CR>
nmap <F6> :wa<CR><bar>:!ipython2 -i %<CR>
nmap <F7> k:SyntasticCheck<CR> 
nmap <F8> :!ctags -R .<CR>
nmap <F9> :wa<CR>:!python2 setup.py build_ext --inplace<CR>

set shiftwidth=2
set tabstop=2

let test#python#runner = 'pyunit'
set colorcolumn=120
set textwidth=120
