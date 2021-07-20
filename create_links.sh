#!/bin/bash
# create links to this files in home directory
# vim
ln -s ~/dotfiles/vim/vimrc_id.symlink ~/.vimrc
ln -s ~/dotfiles/vim/vim.symlink ~/.vim
# tmux
ln -s ~/dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf 
# visual code settings
ln -s ~/dotfiles/visual_code/settings.json ~/.config/Code/User/settings.json 

# zsh
ln -s ~/dotfiles/zsh/zshrc.symlink ~/.zshrc
bash ./zsh/install.sh

# vim vundle get latest version
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim gruvbox color palette
echo 'source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"' >> ~/.zshrc
git clone git@github.com:morhetz/gruvbox.git ~/.vim/bundle/gruvbox

