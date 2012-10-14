dotfiles
=======

Just another dotfile repo

Mainly consists of dotfiles that are heavly customized for me personally (I know,
shocking).


When I clone this repo on a new machine (or I end up switching/losing an OS), I run:
    initial_setup.py

It's basically a quick and dirty script that just makes links in my home
directory, so that I can get my environment up and running.
This makes maintaining my configs easy as they all stay this dotfiles repo.
note: If the dest link path exists, I make a backup incase it contains
configurations that I did not mean to overwrite.

In here there are configs for use with:
    - python
    - colemak
    - irssi
    - tmux
    - vim
    - vimperator
    - zsh
    - bash

