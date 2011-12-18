        ___       ___       ___   
       /\__\     /\  \     /\__\  
      /:/ _/_   _\:\  \   /::L_L_ 
     |::L/\__\ /\/::\__\ /:/L:\__\
     |::::/  / \::/\/__/ \/_/:/  /
      L;;/__/   \:\__\     /:/  / 
                 \/__/     \/__/  


Vim is my editor of choice. I mostly use it over emacs because of the different
mode and the shortcuts (I used to work with emacs few years ago but I found the
CTRL-… shortcut not really user friendly for me).

## Basic information

My Vim configuration highlights are the following :

* Not compatible (`set nocompatible`)
* Host-based sub-configuration loading (to specify specific stuff for any host)
  * a Quick bepow remapping for hosts that have bepo keymap
* Solarized colorscheme
* Usage of pathogen with the following bundle :
  * ack
  * command-t
  * fugitive
  * gundo
  * narrow
  * nerdcommenter
  * OrgMode
  * QFixToggle
  * snipmate
  * surround
  * syntastic
  * taglist
  * unimpaired
  * markdown

I tried to comment the file(s) as much as I can. It is an *always* work in 
progress.

## Try it

Backup your original configuration

    for file in vim vimrc; do mv $HOME/.${file} ${HOME}/${file}; done

Clone the repository

    git clone git://github.com/vdemeester/vim-config.git $HOME/.vim
    cd .vim && git submodule init && git submodule update && cd -

Link .vimrc

    ln -s $HOME/.vim/vimrc $HOME/.vimrc

