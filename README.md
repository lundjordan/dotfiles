dotfiles
=======

## Just another dotfile repo

### DISCLAIMER:
I highly recommend only viewing my files and not running
things like initial_setup.py. This setup is highly tailored for me and will
probably cause spurious/confusing results for you...

When I clone this repo on a new machine as ~/bin/dotfiles, (or I end up switching/losing an OS), I run:
* initial_setup.py

This script will clone oh-my-zsh in ~/.oh-my-zsh and create some links in my home dir to files/dirs
in this dotfiles repo

note: If the dest link path exists, I make a backup incase it contains
configurations that I did not mean to overwrite. The backup dir is in
~/dotfiles_backup

In here there are configs for use with:
* python
* colemak
* irssi
* tmux
* vim
* vimperator
* zsh
* bash

For a new machine I still havn't automated some tasks. These are some things
that I need to do for python/vim setup. I'll document this below so I don't
forget what to do.


### Mac os x setup

First things first, install homebrew!

```
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
```

Then run 'brew doctor' and follow any instructions to make sure your machine
is ready for brew. By memory, I seem to recall having to install cmd line
tools/xcode, and making sure that my PATH had '/usr/local/bin' listed before
anything else. This is because brew installs packages here so we want our path
to pick up things like python from here rather than the default '/usr/bin'

```
brew doctor
```

TIP: regularly run 'brew upgrade' and 'brew doctor' to make sure that 1) all
your packages are up to date and 2) your machine is setup well for homebrew

If brew doesn't complain, install some packages. Install python, vim, tmux, wget, git, mercurial,
screen, gpg via the cmd:

```
brew install {package_name}
```

I know some of these packages are installed by default in mac os x, but these
packages, I find, are maintained/updated more.

NOTE: this usually all you need to do. If installs complain, you may need to
run things like 'brew link' to set up links to '/usr/local/bin'. Fear not,
this is usually taken care of and install/doctor commands will tell you if you
need to run anything extra.

Now let's move on to python/vim setup. To be sure sure, open a new prompt or
source your dotfiles and make sure that 'which python' points to
/usr/local/bin. This python should be around 2.7.5 and works better with vim
plugins.

Feel free to pip/easy_install your favorite modules like virtualenv

Now with regards to vim, first things first, install pathogen by following
instructions from here:
https://github.com/tpope/vim-pathogen

NOTE: In my dotfiles, this should all be set up with my .vim and .vimrc

Now that pathogen is installed, let's clone some vim plugins into
'~/.vim/bundle'. NOTE: I should be using git submodules but cloning directly into
the bundle dir works good enough.

These are the following vim plugins I install from there respective github
owners (some of these are for dependancies of others):

ctrlp.vim jedi-vim, python-mode, tlib_vim, vim-addon-mw-utils vim-repeat,
vim-snipmate, vim-snippets, vim-surround

```
cd ~/.vim/bundle
git clone {github plugin url}
```

NOTE: visit the github repos for further instructions/details on what these
do and how to use them.

ANOTHER NOTE: if you end up using my dotfiles and running things like
initial_setup.py, 1) you're crazy, and 2) you will probably have to delete
whatever is in ~/.vim/bundle first as I think there are some empty dirs/old
plugins (this is because I added some of these plugins to my dotfiles repo and
I havn't untracked them yet)

OK, so now let's talk about some of these plugins. There are three key ones I
can't live without.

1. ctrlp.vim: This is like command-t but it has less dependancies and works very very
well. It is a file/buffer manager for repos/src_code trees.
2. python-mode: this is a one stop shop for setting up a python IDE in vim.
   Visit https://github.com/klen/python-mode for more details. The only thing
   I don't like is how it uses 'rope'. I prefer jedi for navigating
   class/method/function definitions. So I disable it via my vimrc:
```
let g:pymode_rope = 0
```
3. as my rope replacement, I have jedi-vim. Visit
   https://github.com/davidhalter/jedi-vim for details on its uses and
   installation. NOTE: for installation, if you have already cloned it in
   ~/.vim/bundle, all you need to do is:
```
cd ~/.vim/bundle/jedi-vim
git submodule update --initt
```


That should be about it. Check out my conf files like vimrc, tmux.conf, and
zshrc for more settings!




