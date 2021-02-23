#!/bin/bash

sudo apt install zsh tmux -y
git clone https://github.com/cynosuretw/dotvim ~/dotvim

ln -s ~/dotvim/vimrc ~/.vimrc
ln -s ~/dotvim/tmux.conf ~/.tmux.conf
ln -s ~/dotvim/zshrc ~/.zshrc

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
