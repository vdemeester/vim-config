" force terminal to use 256 colors
set t_Co=16
if has("gui_running")
	set guifont=Inconsolata-dz\ 9
endif

" Gohei is a Linux host
" if !empty(system("setxkbmap -print|grep bepo"))
    let g:keymap_bepo = 1
" endif
