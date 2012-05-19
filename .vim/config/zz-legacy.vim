" Hide the mouse when writing/using vim (who needs a mouse anyway !)
" set mousehide
" Indicates a fast terminal connection
" set ttyfast
" Do not redraw the screen 
" set lazyredraw
" Convenience Mapping (leader) ------------------------------------------------ {{{
" From rtomayko : « I use these commands in my TODO file »
map ,a o<ESC>:r!date +'\%A, \%B \%d, \%Y'<CR>:r!date +'\%A, \%B \%d, \%Y' \| sed 's/./-/g'<CR>A<CR><ESC>
map ,o o[ ] 
map ,O O[ ] 
map ,x :s/^\[ \]/[x]/<CR>
map ,X :s/^\[x\]/[ ]/<CR>
" Tags
nnoremap <leader>T :!ctags -R -f ./tags .<cr>
" }}}
