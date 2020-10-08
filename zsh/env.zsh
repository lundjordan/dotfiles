export EDITOR=/usr/local/bin/vim

export PATH=:/Users/jlund/.poetry/bin:/usr/local/bin:/usr/local/sbin:$PATH


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
export REP=~/devel/mozilla/repos/
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


# export WORKON_HOME=$HOME/.virtualenvs
# VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
# source /usr/local/bin/virtualenvwrapper.sh
# bpythonrc path
# export PYTHONSTARTUP=~/.pythonrc
# unset VIRTUAL_ENV


if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
