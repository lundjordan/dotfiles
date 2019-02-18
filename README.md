dotfiles
=======

## Just another dotfile repo

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

In here there are configs for use with:
python, tmux, vim, zsh, iterm, ssh, gpg, git, hg

### Mac os x setup

# install from app store

* 1password
* moom
* things
* daisydisk
* slack

# install unmanaged packages

* https://www.iterm2.com/
* https://www.alfredapp.com/
* https://www.mozilla.org/en-US/firefox/channel/desktop/
* https://www.sparklabs.com/viscosity/download/
* https://v.mozilla.com/
* https://transmissionbt.com/download/
* https://www.videolan.org/vlc/download-macosx.html

## install brew

https://brew.sh/

## install gpgtools

https://gpgtools.org/

## macOS command line tools

https://developer.apple.com/xcode/features/ (not all of xcode)

## install docker

https://store.docker.com/editions/community/docker-ce-desktop-mac

# install brew packages

* ssh
* zsh
* wget
* hg
* git
* vim
* python
* watchman

# copy gpg, ssh keys, zsh_history from external hdd

# setup dotfiles

```bash
mkdir -p ~/devel/personal
mkdir -p ~/devel/mozilla/{playgroud,repos,releaseduty}
mkdir -p ~/opensrc/bitbucket
mkdir ~/.vim_swps
mkdir ~/.iterm
mkdir ~/.ssh
mkdir -p ~/.mozbuild
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git@github.com:lundjordan/dotfiles.git ~/devel/personal/dotfiles
hg clone https://bitbucket.org/sjl/hg-prompt ~/opensrc/bitbucket
hg clone https://hg.mozilla.org/hgcustom/version-control-tools ~/.mozbuild/version-control-tools

cd ~/devel/personal/dotfiles

# initial_setup.py sort of works.
# python intial_setup.py
# better to:
ln -s ~/devel/personal/dotfiles/ssh/config ~/.ssh/config
ln -s ~/devel/personal/dotfiles/hg/hgrc ~/.hgrc
ln -s ~/devel/personal/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/devel/personal/dotfiles/tmux/tmuxrc ~/.tmuxrc
ln -s ~/devel/personal/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/devel/personal/dotfiles/iterm/com.googlecode.iterm2.plist ~/.iterm/com.googlecode.iterm2.plist
ln -s ~/devel/personal/dotfiles/gpg/gpg.conf ~/.gnupg/gpg.conf
ln -s ~/devel/personal/dotfiles/zsh/jlundmercurial.plugin.zsh ~/.oh-my-zsh/custom/plugins/jlundmercurial/jlundmercurial.plugin.zsh
ln -s ~/devel/personal/dotfiles/zsh/jlund_juang.zsh-theme  ~/.oh-my-zsh/custom/themes/jlund_juang.zsh-theme
ln -s ~/devel/personal/dotfiles/zsh/aliases.zsh  ~/.oh-my-zsh/custom/aliases.zsh
ln -s ~/devel/personal/dotfiles/zsh/env.zsh  ~/.oh-my-zsh/custom/env.zsh
ln -s ~/devel/personal/dotfiles/zsh/config.zsh  ~/.oh-my-zsh/custom/config.zsh
