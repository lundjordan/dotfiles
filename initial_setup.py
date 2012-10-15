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


def start():
    # thus far lets just make the appropriate links and backup any existing
    # destinations
    make_links()


def make_links():
    for target, link in enumerate(links):
        abs_target_path = os.path.join(abs_dotfiles_path, target)
        abs_link_path = os.path.join(abs_home_path, link)

        while True:
            try:
                os.symlink(abs_target_path, abs_link_path)
                print 'symlinking %s to %s' % (abs_target_path, abs_link_path)
                break
            except OSError, e:
                if e.errno == 17:  # file exists
                    backup_and_remove(link)
                else:
                    print e.message  # not sure if thats how we deal with excepts


def backup_and_remove(link):
    """backs up the file that already exists then removes it"""
    abs_copy_src_path = os.path.join(abs_home_path, link)
    abs_copy_dest_path = os.path.join(abs_backup_dir, link)
    backup_message = 'backing up %s to %s' % (abs_copy_src_path, abs_copy_dest_path)
    remove_message = 'removing %s' % (abs_copy_src_path)

    if not os.path.exists(abs_backup_dir):
        os.mkdir(abs_backup_dir)
    try:
        if os.path.isdir(abs_copy_src_path):
            print backup_message
            shutil.copytree(abs_copy_src_path, abs_copy_dest_path)
            print remove_message
            shutil.rmtree(abs_copy_src_path)
        else:
            print backup_message
            shutil.copy2(abs_copy_src_path, abs_copy_dest_path)
            print remove_message
            os.remove(abs_copy_src_path)
    except:
        print 'could not copy or remove %s to %s' % (abs_copy_src_path,
                                                     abs_copy_dest_path)
        sys.exit(0)

if platform.system() != 'Windows':
    start()
else:
    print "I'd imagine this would have spurious results in Windows, \
            best not use this script.\nSkipping..."
