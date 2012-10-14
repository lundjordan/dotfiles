#!/usr/bin/python

import os
import sys
import shutil
import platform

abs_home_path = os.getenv('HOME')
abs_dotfiles_path = os.path.join(abs_home_path, 'bin/dotfiles')
abs_backup_dir = os.path.join(abs_home_path, 'dotfiles_backup')

links = {'zsh/zshrc': '.zshrc',
         'bash/bashrc': '.bashrc',
         'vim/vimrc': '.vimrc',
         'vim/vim': '.vim',
         'tmux/tumx.conf': '.tmux.conf',
         'tmux/tmux': '.tmux',
         'irssi': '.irssi'}


def make_links():
    for target, link in enumerate(links):
        abs_target_path = os.path.join(abs_dotfiles_path, target)
        abs_link_path = os.path.join(abs_home_path, link)

        while True:
            try:
                os.symlink(abs_target_path, abs_link_path)
                print 'linking %s to %s' % (abs_target_path, abs_link_path)
                break
            except OSError, e:
                if e.errno == 17:  # file exists
                    backup_and_remove(link)


def backup_and_remove(link):
    """backs up the file that already exists then removes it"""
    abs_src_path = os.path.join(abs_home_path, link)
    abs_destination_path = os.path.join(abs_backup_dir, link)

    if not os.path.exists(abs_backup_dir):
        os.mkdir(abs_backup_dir)
    try:
        print 'backing up %s to %s' % (abs_src_path, abs_destination_path)
        shutil.copyfile(abs_src_path, abs_destination_path)
        print 'removing %s' % (abs_src_path)
        os.remove(abs_src_path)
    except:
        print 'could not copy or remove %s to %s' % (abs_src_path,
                                                     abs_destination_path)
        sys.exit(0)

if platform.system() != 'Windows':
    make_links()
else:
    print "I'd imagine this would have spurious results in Windows, \
            best not use this script.\nSkipping..."
