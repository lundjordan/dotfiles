#######################################
# shortcut aliases and functions
#######################################


#############
#permanent aliases
#############

# taskwarrior alias's
alias tstw='task due:today project:warrior'
alias tsaw='task project:warrior'
alias taaw='task add priority:M project:warrior'
alias tatw='task add priority:M due:today project:warrior'

alias tstm='task due:today project:mozharness'
alias tsam='task project:mozharness'
alias taam='task add priority:M project:mozharness'
alias tatm='task add priority:M due:today project:mozharness'

alias tstp='task due:today project:promotion'
alias tsap='task project:promotion'
alias tatp='task add priority:H due:today project:promotion'
alias taap='task add priority:H project:promotion'

alias tstd='task due:today project:releaseduty'
alias tsad='task project:releaseduty'
alias tatd='task add priority:H due:today project:releaseduty'
alias taad='task add priority:H project:releaseduty'

alias tstr='task due:today project:reviews'
alias tsar='task project:reviews'
alias tatr='task add priority:H due:today project:reviews'
alias taar='task add priority:H project:reviews'

alias tstc='task due:today project:tcmigration'
alias tsac='task project:tcmigration'
alias tatc='task add priority:H due:today project:tcmigration'
alias taac='task add priority:H project:tcmigration'

alias tsts='task due:today project:shipit'
alias tsas='task project:shipit'
alias tats='task add priority:H due:today project:shipit'
alias taas='task add priority:H project:shipit'

alias tstx='task due:eow project:macos-setup'
alias tsax='task project:macos-setup'
alias tatx='task add priority:H due:today project:macos-setup'
alias taax='task add priority:H project:macos-setup'

# alias tstl='task due:today project:loantool'
# alias tsal='task project:loantool'
# alias tatl='task add priority:H due:today project:loantool'
# alias taal='task add priority:H project:loantool'
# 
# alias tstb='task due:today project:mh-builds'
# alias tsab='task project:mh-builds'
# alias tatb='task add priority:M due:today project:mh-builds'
# alias taab='task add priority:M project:mh-builds'
# 
# alias tstw='task due:today project:wasabi'
# alias tsaw='task project:wasabi'
# alias tatw='task add priority:H due:today project:wasabi'
# alias taaw='task add priority:M project:wasabi'
# 
# alias tstd='task due:today project:buildduty'
# alias tsad='task project:buildduty'
# alias tatd='task add priority:M due:today project:buildduty'
# alias taad='task add priority:M project:buildduty'
# 
# alias tstv='task due:today project:vs2013'
# alias tsav='task project:vs2013'
# alias tatv='task add priority:M due:today project:vs2013'
# alias taav='task add priority:M project:vs2013'
# 
# alias tstx='task due:today project:blackbox'
# alias tsax='task project:blackbox'
# alias tatx='task add priority:M due:today project:blackbox'
# alias taax='task add priority:M project:blackbox'
# 
# alias tstk='task due:today project:apk'
# alias tsak='task project:apk'
# alias tatk='task add priority:M due:today project:apk'
# alias taak='task add priority:M project:apk'
# 
# alias tsth='task due:today project:hg-repos'
# alias tsah='task project:hg-repos'
# alias tath='task add priority:M due:today project:hg-repos'
# alias taah='task add priority:M project:hg-repos'

alias tata='task add due:today'
alias tt='task due:today'

alias tsar='task project:reviews'
alias tatr='task add priority:H due:today project:reviews'


####### Configs
# source zsh
alias sz='. ~/.zshrc'
# zsh rc shortcut
alias viz='vim ~/.zshrc'
# zsh alias shortcut
alias via='vim ~/devel/personal/dotfiles/zsh/aliases.zsh'
# my zsh config
alias vic='vim ~/devel/personal/dotfiles/zsh/config.zsh'
# my zsh config
alias vie='vim ~/devel/personal/dotfiles/zsh/env.zsh'
# alias's to dirs
alias cdot='cd ~/devel/personal/dotfiles'
# alias to vimrc
alias vimrc='vim ~/.vimrc'
# alias to vimrc
alias vimnotes='vim ~/devel/personal/dotfiles/notes/vim_cheat_sheet.txt'
########

# tmux
# alias tmux="TERM=screen-256color-bce tmux -2"
alias tmum="~/.tmux/tmux_mozilla"


# Mozilla functions

function peop ()
{
        filename=$(basename $1)
        scp $1 people.mozilla.org:public_html/
        echo "http://people.mozilla.org/~jlund/${filename}"
}

ggrel ()
{
    grep --color=always --exclude-dir coverage -rnC 6 "$1" . | less -R
}

# general
alias -g L="| less" # Write L after a command to page through the output.
alias -g G="| grep"
alias -g TL='| tail -20'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# MOZILLA
alias -g PEOP="people.mozilla.org:/home/jlund/public_html"

# file paths
# alias -g DOT='~/devel/personal/dotfiles/'
# alias -g DEV='~/devel'
# alias -g MOZ='~/devel/mozilla'
# alias -g LEA='~/devel/learn/'
# alias -g LEAA='~/devel/learn/android/'
# alias -g LEAC='~/devel/learn/C'
# alias -g LEAN='~/devel/learn/node'
# alias -g LEAB='~/devel/learn/backbone'
# alias -g LEAP='~/devel/learn/patterns/'
# alias -g GOF='~/devel/learn/final_project/goferIT'
# alias -g DOW='~/Downloads/'
# alias -g DOC='~/Documents/'

# gofer alias
alias -g GCOF='coffee -w -c -o public/js backbone-src/**/*.coffee'


alias todo=task
alias dled='ls -t ~/Downloads/**/* | head -n1'
alias ubunotes='vim ~/devel/personal/dotfiles/notes/ubuntu_fresh_install.md'

# oh-my-zsh overrides
