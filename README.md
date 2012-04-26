configs
=======

Just another dotfile repo

In ~/ I have:

❲Adelaide366❳→jlund: ~               
→ cat ~/.bashrc

. ~/bin/dotfiles/bashrc


❲Adelaide366❳→jlund: ~                                                                                                                    
→ cat ~/.bash_profile 

if [ -f ~/.bashrc ];                                                                         
then                                                                                                 
    source ~/.bashrc                                                                               
fi                                                                                             

❲Adelaide366❳→jlund: ~                                                                                        
→ cat ~/.zshrc                                                                                    
. ~/bin/dotfiles/zsh/env                                                                    
. ~/bin/dotfiles/zsh/config                                                                          
. ~/bin/dotfiles/zsh/aliases                                                                           


...and soft links for vim related stuff

