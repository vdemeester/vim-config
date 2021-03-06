" Is my keymap in bepo, or not ?
" - yes = 1
" - no  = 0
" by default let say, it's not
" if we are on a bepo keymap operating system, load the remapping file.
if g:keymap_bepo == 1
    " configuration des lettres
    " [HJKL] -> {CTSR}
    " ————————————————
    " {cr} = « gauche / droite »
    noremap c h
    noremap r l
    " {ts} = « haut / bas »
    noremap t j
    noremap s k
    " {CR} = « haut / bas de l'écran »
    noremap C H
    noremap R L
    " {TS} = « joindre / aide »
    noremap T J
    noremap S K
    " Corollaire : repli suivant / précédent
    noremap zs zj
    noremap zt zk

    " {HJKL} <- [CTSR]
    " ————————————————
    " {J} = « Jusqu'à »            (j = suivant, J = précédant)
    noremap j t
    noremap J T
    " {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
    noremap l c
    noremap L C
    " {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
    noremap h r
    noremap H R
    " {K} = « Substitue »          (k = caractère, K = ligne)
    noremap k s
    noremap K S
    " Corollaire : correction orthographique
    noremap ]k ]s
    noremap [k [s

    " Désambiguation de {g}
    " —————————————————————
    " ligne écran précédente / suivante (à l'intérieur d'une phrase)
    noremap gs gk
    noremap gt gj
    " onglet précédant / suivant
    noremap gb gT
    noremap gé gt
    " optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
    noremap gB :exe "silent! tabfirst"<CR>
    noremap gÉ :exe "silent! tablast"<CR>
    " optionnel : {g"} pour aller au début de la ligne écran
    noremap g" g0

    map <C-c> <C-w>h
    map <C-t> <C-w>j
    map <C-s> <C-w>k
    map <C-r> <C-w>l
    map <C-o> :redo<CR>

    " Gundo specific
    let g:gundo_map_move_older = "t"
    let g:gundo_map_move_newer = "s"

    " Remapping ] and [ to ) and ( for maps (unimpaired, etc…)
    " https://github.com/tpope/vim-unimpaired/pull/10#issuecomment-1756676
    for s:c in map(range(65,90) + range(97,122),'nr2char(v:val)')
      exec 'nmap ('.s:c.' ['.s:c
      exec 'xmap ('.s:c.' ['.s:c
      exec 'nmap )'.s:c.' ]'.s:c
      exec 'xmap )'.s:c.' ]'.s:c
    endfor
endif

