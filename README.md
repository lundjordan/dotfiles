dotfiles
=======

Just another dotfile repo

### DISCLAIMER:
> I recommend only viewing my files and not running
things like initial_setup.py. This setup is highly tailored for me and will
probably cause spurious/confusing results for you...

* initial_setup.py

This script will clone oh-my-zsh in ~/.oh-my-zsh and create some links in my home dir to files/dirs
in this dotfiles repo

NOTE: If the dest link path exists, a backup is created incase it contains
configurations that I did not mean to overwrite. The backup dir is in
~/dotfiles_backup

# Mac os x setup

## Install packages

### install from app store

* 1password
* moom
* things
* daisydisk
* slack

### install unmanaged packages

* https://www.iterm2.com/
* https://www.alfredapp.com/
* https://www.mozilla.org/en-US/firefox/channel/desktop/
* https://www.sparklabs.com/viscosity/download/
* https://v.mozilla.com/
* https://transmissionbt.com/download/
* https://www.videolan.org/vlc/download-macosx.html

### install brew

https://brew.sh/
```
bash fzf git gnu-sed mercurial openssh pyenv pyenv-virtualenv tmux vim watchman wget zlib zsh
```

### install gpgtools

https://gpgtools.org/

### macOS command line tools

(brew should install this by default now)

### install docker

https://store.docker.com/editions/community/docker-ce-desktop-mac



## setup dotfiles

### get secrets from backup disk
copy .gnupg dir, .ssh dir , and .zsh_history from backup

### create some initial homedirs
```
mkdir -p ~/devel/personal
mkdir -p ~/devel/mozilla/{playgroud,repos,releaseduty}
mkdir -p ~/opensrc/bitbucket
mkdir -p ~/opensrc/github
mkdir ~/.vim_swps
mkdir ~/.iterm
mkdir -p ~/.mozbuild
mkdir -p ~/.oh-my-zsh/custom/plugins/jlundmercurial
```

### setup oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### clone some needed repos
```
git clone git@github.com:lundjordan/dotfiles.git ~/devel/personal/dotfiles
hg clone https://bitbucket.org/sjl/hg-prompt ~/opensrc/bitbucket/hg-prompt
# only for mozilla env
hg clone https://hg.mozilla.org/hgcustom/version-control-tools ~/.mozbuild/version-control-tools
git clone https://github.com/powerline/fonts.git --depth=1
```

## link homedir paths to dotfiles

### Option 1

initial_setup.py sort of works but I stopped using it.
```
cd ~/devel/personal/dotfiles && python intial_setup.py

### Option 2

####  first remove the backup copies of ssh and gpg config files and instead use dotfiles versions assuming they are the same
```
rm ~/.ssh/config ~/.gnupg/gpg.conf
```

#### now link all dotfiles configs to home dir
```
ln -s ~/devel/personal/dotfiles/ssh/config ~/.ssh/config
ln -s ~/devel/personal/dotfiles/gpg/gpg.conf ~/.gnupg/gpg.conf
ln -s ~/devel/personal/dotfiles/hg/hgrc ~/.hgrc
ln -s ~/devel/personal/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/devel/personal/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/devel/personal/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/devel/personal/dotfiles/iterm/com.googlecode.iterm2.plist ~/.iterm/com.googlecode.iterm2.plist  # add in iterm pref
ln -s ~/devel/personal/dotfiles/zsh/jlundmercurial.plugin.zsh ~/.oh-my-zsh/custom/plugins/jlundmercurial/jlundmercurial.plugin.zsh
ln -s ~/devel/personal/dotfiles/zsh/jlund_juang.zsh-theme  ~/.oh-my-zsh/custom/themes/jlund_juang.zsh-theme
ln -s ~/devel/personal/dotfiles/zsh/jlundmercurial.plugin.zsh  ~/.oh-my-zsh/custom/plugins/jlundmercurial/jlundmercurial.plugin.zsh
ln -s ~/devel/personal/dotfiles/zsh/aliases.zsh  ~/.oh-my-zsh/custom/aliases.zsh
ln -s ~/devel/personal/dotfiles/zsh/env.zsh  ~/.oh-my-zsh/custom/env.zsh
ln -s ~/devel/personal/dotfiles/zsh/config.zsh  ~/.oh-my-zsh/custom/config.zsh
ln -s ~/devel/personal/dotfiles/zsh/zshrc ~/.zshrc
```


#### vim setup
```
# managing plugins with vim https://gist.github.com/manasthakur/ab4cf8d32a28ea38271ac0d07373bb53
# setup vim https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560
git clone --recursive git@github.com:lundjordan/vimfiles.git ~/devel/personal/vimfiles
ln -s ~/devel/personal/vimfiles ~/.vim
vim
:helptags ALL
```

#### setup pyenv
```
# https://gist.github.com/eliangcs/43a51f5c95dd9b848ddc
pyenv install --list
pyenv install 3.{*}
pyenv global 3.{*}

# virtualenvs
https://github.com/pyenv/pyenv-virtualenv#usage
pyenv virtualenv ${someproject} # uses current pyenv version
cd $someproject_dir pyenv local $someproject

#### install powerline status bar for tmux and vim
```
# awkward but needs to be installed in pyenv version for shell and system for vim
pyenv global 3
pip install powerline-status

pyenv global system
pip3 install powerline-status

#switch back to main global python version
pyenv global 3

# install fonts
cd ~/opensrc/github/fonts
./install.sh
# add font to iterm: https://gist.github.com/wm/4750511#configure-iterm-to-use-the-powerline-fonts
