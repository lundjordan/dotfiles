#!/usr/bin/env python3

"""
This script has some dependencies.
First make sure: [ zsh git vim tmux ssh gpg] are installed
"""

import os
import shutil
import platform
import subprocess

ABS_HOME_PATH = os.getenv('HOME')
ABS_DOTFILES_PATH = os.path.join(ABS_HOME_PATH, 'devel/personal/dotfiles')
ABS_BACKUP_DIR = os.path.join(ABS_HOME_PATH, 'dotfiles_backup')

HOME_LINKS = {
    'zsh/zshrc': '.zshrc',
    'vim/vimrc': '.vimrc',
    'tmux/tmux.conf': '.tmux.conf',
    'iterm/com.googlecode.iterm2.plist': '.iterm/com.googlecode.iterm2.plist',
    'git/gitconfig': '.gitconfig',
    'hg/hgrc': '.hgrc',
    'ssh/config': '.ssh/config',
    'gpg/gpg.conf': '.gnupg/gpg.conf',
}


def start():
    # thus far lets just make the appropriate links and backup any existing
    # destinations
    make_links(links=HOME_LINKS, base_link_path=ABS_HOME_PATH)


def make_links(links, base_link_path):
    for target, link in links.iteritems():
        abs_target_path = os.path.join(ABS_DOTFILES_PATH, target)
        abs_link_path = os.path.join(base_link_path, link)
        base_notification = '%s to %s' % (abs_target_path, abs_link_path)

        try:
            if os.path.exists(abs_link_path):
                backup_and_remove(link, base_link_path)
            print('symlinking ' + base_notification)
            os.symlink(abs_target_path, abs_link_path)
        except:
            print('could not link ' + base_notification)


def backup_and_remove(dest, base_link_path):
    """backs up the file that already exists then removes it"""
    abs_src_path = os.path.join(base_link_path, dest)
    abs_dest_path = os.path.join(ABS_BACKUP_DIR, dest)
    base_notification = '%s to %s' % (abs_src_path, abs_dest_path)

    if not os.path.exists(ABS_BACKUP_DIR):
        os.mkdir(ABS_BACKUP_DIR)
    try:
        print('moving ' + base_notification)
        shutil.move(abs_src_path, abs_dest_path)
    except:
        print('could not move ' + base_notification)


if platform.system() != 'Windows':
    start()
else:
    print( "I'd imagine this would have spurious results in Windows, \
            best not use this script.\nSkipping...")
