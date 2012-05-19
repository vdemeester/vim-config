" Show matches when typing the pattern
set incsearch
" Ignore case by default in search
" Possible to re-enabling it using \C in the search pattern
set ignorecase
" Highlight matches of search by default - use :nohlsearch for hiding it
set hlsearch
" Magic mode (in pattern matching)
" Possible to disable it using \M (read help for more informations)
set magic
" Show the matche pair (for(,[,{,<,…)
set showmatch

" Open a Quickfix window for the last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" make <C-L> (redraw screen) also turn off
" search highlighting until the next search
" http://vim.wikia.com/wiki/Example_vimrc
nnoremap <C-L> :nohlsearch<Enter><C-L>

" list all occurrences of word under cursor in current buffer
nnoremap <Leader>* [I

" find merge conflict markers
nnoremap <Leader>! /\v^[<=>]{7}( <Bar>$)/<Enter>

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
