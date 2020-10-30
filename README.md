dotvim
======
MANUALLY INSTALL
----------------

1. Check out from GitHub

        git clone https://github.com/cynosuretw/dotvim ~/.vim

2. Install ~/.vimrc ~/.tmux.conf ~/.zshrc

        ln -s ~/.vim/vimrc ~/.vimrc 
        ln -s ~/.vim/tmux.conf ~/.tmux.conf
        ln -s ~/.vim/zshrc ~/.zshrc

3. Install plugin by Vundle, and lunch Vim 

        vim +BundleInstall 

4. Install tmux > 2.2 

        sudo apt-get install tmux
        #tmux plug manager https://github.com/tmux-plugins/tpm
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        
5. Install oh-my-zsh

        git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

6. Install pip package for vim deoplete.nvim

        pip3 install autopep8
        pip3 install rstcheck #for reStructuredText
