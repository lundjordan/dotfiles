#!/usr/bin/python

import os
import shutil
import platform

ABS_HOME_PATH = os.getenv('HOME')
ABS_BIN_PATH = os.path.join(ABS_HOME_PATH, 'bin')
ABS_DOTFILES_PATH = os.path.join(ABS_HOME_PATH, 'bin/dotfiles')
ABS_BACKUP_DIR = os.path.join(ABS_HOME_PATH, 'dotfiles_backup')

HOME_LINKS = {'zsh/zshrc': '.zshrc',
              'bash/bashrc': '.bashrc',
              'vim/vimrc': '.vimrc',
              'vim/vim': '.vim',
              'tmux/tumx.conf': '.tmux.conf',
              'tmux/tmux': '.tmux',
              'irssi': '.irssi'}

BIN_LINKS = {'vcprompt': 'vcprompt'}


def start():
    # thus far lets just make the appropriate links and backup any existing
    # destinations
    make_links(links=HOME_LINKS, root_link_path=ABS_HOME_PATH)
    make_links(links=BIN_LINKS, root_link_path=ABS_BIN_PATH)


def make_links(links, root_link_path):
    for target, link in links.iteritems():
        abs_target_path = os.path.join(ABS_DOTFILES_PATH, target)
        abs_link_path = os.path.join(root_link_path, link)
        base_notification = '%s to %s' % (abs_target_path, abs_link_path)

        try:
            if os.path.exists(abs_link_path):
                backup_and_remove(link)
            print 'symlinking ' + base_notification
            os.symlink(abs_target_path, abs_link_path)
        except:
            print 'could not link ' + base_notification


def backup_and_remove(dest, root_link_path):
    """backs up the file that already exists then removes it"""
    abs_src_path = os.path.join(root_link_path, dest)
    abs_dest_path = os.path.join(ABS_BACKUP_DIR, dest)
    base_notification = '%s to %s' % (abs_src_path, abs_dest_path)

    if not os.path.exists(ABS_BACKUP_DIR):
        os.mkdir(ABS_BACKUP_DIR)
    try:
        print 'moving ' + base_notification
        shutil.move(abs_src_path, abs_dest_path)
    except:
        print 'could not move ' + base_notification


if platform.system() != 'Windows':
    start()
else:
    print "I'd imagine this would have spurious results in Windows, \
            best not use this script.\nSkipping..."
