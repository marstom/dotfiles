## Repo contain my linux config, vim, tmux etc.
##### Creating symbolic link to my dotfile:
```bash
ln -s dotfiles/vim/vimrc_id.symlink .vimrc
```


## Important packages for my linux:


1. Install packages
sudo apt-get install \ 
```bash
    xclip && \ # tmux copy need this
    tmux
```

2. Vim with clipboard support:
```bash
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt install vim
```

