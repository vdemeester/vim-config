" Change the default statusline
set statusline=%f\ %m
if exists('*fugitive#statusline')
    set statusline+=\ %{fugitive#statusline()}
endif
set statusline+=%*
set statusline+=\ %h%r%=[%{&encoding}
set statusline+=\ %{&fileformat}
set statusline+=\ %{strlen(&ft)?&ft:'none'}
set statusline+=\ %{getfperm(@%)}]
set statusline+=\ 0x%B\ %12.(%c:%l/%L%)

