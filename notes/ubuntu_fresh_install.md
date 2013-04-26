# Providing a *smooth* clean Ubuntu install 

## Pre-Install:

1. clean up old Home folder
2. backup old Home folder
3. dl new version of Ubuntu

## Install
    #### notes: remember to make a separate /home partition, install third
    party codecs, and set keyboard layout to colemak

## Post-Install:

1. first things first...
    keyboard shortcuts: window and workspaces
    set a new wallpaper :)

1. move bup essential files to home folder:
    - .ssh
    - .zsh_history
    - .mozilla
    - .vim_swps
    - .aws_keys
    - bin
    - devel
    - opensrc
    - sftwre
    - Music
    - Documents
    - playground

1. install essential packages:
    ```zsh
    sudo apt-get install zsh vim git tmux terminator guake cmus vlc
    chromium-browser fonts-inconsolata irssi 
    ```

1. install essential packages:
    ```zsh
    sudo apt-get install zsh vim git tmux terminator guake cmus vlc
    chromium-browser fonts-inconsolata
    ```

1. set up zsh with oh-my-zsh:
    **clone dotfiles if they were not backed up**
    ```zsh
    git clone git@github.com:lundjordan/dotfiles.git ~/bin
    ```

    **now set up dotfiles links
    ```zsh
    ln -s ~/bin/dotfiles/tmux/tmux ~/.tmux
    ln -s ~/bin/dotfiles/tmux/tmux.conf ~/.tmux.conf
    ln -s ~/bin/dotfiles/vim/vim ~/.vim
    ln -s ~/bin/dotfiles/vim/vimrc ~/.vimrc
    ln -s ~/bin/dotfiles/vim/colemakrc ~/.colemakrc
    ln -s ~/bin/dotfiles/vimperator/vimperatorrc ~/.vimperatorrc
    ln -s ~/bin/dotfiles/taskwarrior/task ~/.task
    ln -s ~/bin/dotfiles/taskwarrior/taskrc ~/.taskrc
    ln -s ~/bin/dotfiles/irssi ~/.irssi
    ```

1. set up zsh with oh-my-zsh:
    ```zsh
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    ln -s ~/bin/dotfiles/zsh/jlund_ohmyzsh_template ~/.zshrc
    ln -s ~/bin/dotfiles/zsh/env ~/.oh-my-zsh/custom/jlund_env.zsh
    ln -s ~/bin/dotfiles/zsh/config ~/.oh-my-zsh/custom/jlund_config.zsh
    ln -s ~/bin/dotfiles/zsh/aliases ~/.oh-my-zsh/custom/jlund_aliases.zsh
    ```

1. set up terminator and guake profiles
    cp bup to ~/.config/terminator
    cp bup to ~/.gconf/guake

1. icons/themes:
    ```zsh
    sudo add-apt-repository ppa:tiheum/equinox
    sudo apt-get update && sudo apt-get install faenza-icon-theme faience-* 
    ```

1. tweak tools
    ```zsh
    sudo add-apt-repository ppa:tualatrix/ppa
    sudo apt-get update
    sudo apt-get install ubuntu-tweak
    ```
    ### now set themes, colors, and unity/workspace settings



