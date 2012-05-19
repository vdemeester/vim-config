set nobackup writebackup " backup current file, deleted afterwards

nnoremap <Leader>s :write<Enter>
nnoremap <Leader>S :saveas<Space>
" - Quick saving
nmap <leader>w :w!<CR>
" → save as root
cmap w!! %!sudo tee > /dev/null %
