set autoindent          " automatically indent new lines
set textwidth=78        " hard-wrap long lines as you type them
" The rest is going to be set by filetype
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap
set formatoptions=qrn1  " better formatoptions stolen from Seve Losh
set formatoptions+=o    " continue comment marker in new lines

" repeat last character to the maximum width of current line
nnoremap <Leader>_ :execute 's/.$/'. repeat('&', &textwidth+1) .'/'<Enter>
      \:execute 's/\%>'. &textwidth .'v.//g'<Enter>
"
