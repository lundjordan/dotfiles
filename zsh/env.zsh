export EDITOR=/usr/bin/vim

# #lynx homepage
# export WWW_HOME=http://www.google.com
# 
# export PATH=~/bin:$PATH
# export PATH=$PATH:~/.android-sdk-linux/tools:~/.android-sdk-linux/platform-tools
# export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# AWS
# export JAVA_HOME="/usr/lib/jvm/jdk1.7.0_25/"
# export AWS_AUTO_SCALING_HOME=~/devel/AWS/AutoScaling-1.0.61.2
# export PATH="$PATH:$AWS_AUTO_SCALING_HOME/bin:$JAVA_HOME/bin"
# from aws re:invent
# export AWS_CREDENTIAL_FILE=~/devel/AWS/jlund-credentials
# export AWS_AUTO_SCALING_URL=https://autoscaling.eu-west-1.amazonaws.com


# vim and gnome-terminal have support for 256 colours in fedora 8 at least
# Note debian/ubuntu users need to install the ncurses-term package for this
# Note this should be set in ~/.profile for Fedora startup scripts to
# setup LS_COLORS correctly.
# export TERM=xterm-256color

# Use vim to browse man pages. One can use Ctrl-[ and Ctrl-t
# to browse and return from referenced man pages. ZZ or q to quit.
# Note initially within vim, one can goto the man page for the
# word under the cursor by using [section_number]K.
# Note we use bash explicitly here to support process substitution
# which in turn suppresses the "Vim: Reading from stdin..." warning.
export MANPAGER='bash -c "vim -MRn -c \"set ft=man nomod nolist nospell nonu\" \
-c \"nm q :qa!<CR>\" -c \"nm <end> G\" -c \"nm <home> gg\"</dev/tty <(col -b)"'

# GROFF_NO_SGR is required with man-db which uses grotty to
# output SGR codes by default when attached to a terminal.
# We want vim to highlight the raw text, so disable that feature.
# Also see MANPAGER in my .vimrc for extra handling to support
# ctrl-[ with man-db
export GROFF_NO_SGR=1
# Another option is to use $VIMRUNTIME/macros/less.sh
# though I find that less effective

# DIRS ###########

# Mozilla Environment
export MOZ=~/devel/mozilla/
export REPOS=~/devel/mozilla/repos/
export FIRE=~/devel/mozilla/repos/firefox/
export CUST=~/devel/mozilla/repos/buildbotcustom/
export CONF=~/devel/mozilla/repos/buildbot-configs/
export TOOLS=~/devel/mozilla/repos/tools/
export PAT=~/devel/mozilla/patches/
export LOG=~/devel/mozilla/logs/
export NOT=~/devel/mozilla/notes/
export DEV_MASTER=~/devel/mozilla/dev_master/build-master/

# other dirs
export DOT=~/devel/personal/dotfiles/
export DEV=~/devel
export LEA=~/devel/learn/
export DOW=~/Downloads/
export DOC=~/Documents/


export WORKON_HOME=$HOME/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
source /usr/local/bin/virtualenvwrapper.sh
export PYTHONPATH=~/devel/mozilla/dev_master/:~/devel/mozilla/dev_master/tools/lib/python/
# bpythonrc path
export PYTHONSTARTUP=~/.pythonrc
unset VIRTUAL_ENV

##################
# GITHUB 
# homebrew token for looking up casks. only scope allowed is for
# public repo GET so it's safe to be in plain text
HOMEBREW_GITHUB_API_TOKEN="fb4d17bdcd2e90db5fbabc19100f4e77d18f9d2d"
