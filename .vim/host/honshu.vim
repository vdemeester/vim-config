" force terminal to use 256 colors
set t_Co=256
if has("gui_running")
    set guifont=Monospace\ 8
endif

" Kyushu is a Linux host
" if !empty(system("setxkbmap -print|grep bepo"))
    let g:keymap_bepo = 1
" endif
