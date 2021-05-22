dotvim
======
MANUALLY INSTALL
----------------

1. Check out from GitHub

        git clone https://github.com/cynosuretw/dotvim ~/dotvim

2. Install ~/.vimrc ~/.tmux.conf ~/.zshrc

        ln -s ~/.vim/vimrc ~/.vimrc 
        ln -s ~/.vim/tmux.conf ~/.tmux.conf
        ln -s ~/.vim/zshrc ~/.zshrc
2.a (option), compile vim with python3, lua support
   https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source
   ```
   apt install libncurses5-dev libgtk2.0-dev libatk1.0-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev  \
    python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev git

   ./configure --with-features=huge
            --enable-multibyte
            --enable-rubyinterp=yes
            --enable-python3interp=yes
            --with-python3-config-dir=$(python3-config --configdir)
            --enable-perlinterp=yes
            --enable-luainterp=yes
            --enable-gui=gtk2
            --enable-cscope
            --prefix=/usr/local
   ```

3. Install plugin by vim-plug, and lunch Vim

        vim +PluginInstall

4. Install tmux > 2.2

        sudo apt-get install tmux
        #tmux plug manager https://github.com/tmux-plugins/tpm
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

5. Install oh-my-zsh

        git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

6. Install pip package for vim deoplete.nvim

        pip3 install autopep8
        pip2 install pynvim
        pip3 install rstcheck #for reStructuredText
