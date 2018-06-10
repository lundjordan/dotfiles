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
* alfred

# install unmanaged packages

https://www.iterm2.com/
https://www.mozilla.org/en-US/firefox/channel/desktop/
https://www.sparklabs.com/viscosity/download/
https://www.jetbrains.com/pycharm/
https://v.mozilla.com/
https://www2.meethue.com/en-us/entertainment/hue-sync
https://mullvad.net/en/download/
https://transmissionbt.com/download/
https://www.videolan.org/vlc/download-macosx.html

## install nix

https://nixos.org/nix/manual/#chap-installation
https://nixos.org/nixos/nix-pills/

## install gpgtools

https://gpgtools.org/

## install docker

https://store.docker.com/editions/community/docker-ce-desktop-mac

# install nix packages

* ssh
* zsh
* wget
* hg
* git
* vim
* python
* watchman

# copy gpg, ssh keys from external hdd

# setup dotfiles

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir -p ~/devel/personal
mkdir -p ~/devel/mozilla/{playgroud,repos,releaseduty}
mkdir -p ~/opensrc/bitbucket
git clone git@github.com:lundjordan/dotfiles.git ~/devel/personal/dotfiles
hg clone https://bitbucket.org/sjl/hg-prompt ~/opensrc/bitbucket

cd ~/devel/personal/dotfiles
python intial_setup.py
