#############################
# Other Options

#############################
# Variables

HISTFILE=~/.zsh_history
SAVEHIST=65000
HISTSIZE=65000

REPORTTIME=10 # Show elapsed time if command took more than X seconds

# Make CTRL-W delete after other chars, not just spaces
WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]}

### Automatically Expanding zsh Global Aliases - Simplified
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
   fi
   zle self-insert
}

renew_ssh_agent ()
{
    (umask 066; ssh-agent > ~/.ssh/ssh-agent)
    eval "$(<~/.ssh/ssh-agent)" >/dev/null
}

start_ssh_agent ()
{
    if [ ! -f ~/.ssh/ssh-agent ]; then
        renew_ssh_agent
    else
        eval "$(<~/.ssh/ssh-agent)" >/dev/null
    fi

    ssh-add -l &>/dev/null
    ssh_add_rc="$?"
    if [ $ssh_add_rc = 1 ] || [ $ssh_add_rc = 2 ]; then
        if [ $ssh_add_rc = 2 ]; then
            # ssh-agent defined in ~/.ssh/ssh-agent doesn't exist, recreate
            renew_ssh_agent
        fi
        # set timelimit to 4 hours
        ssh-add -t 14400
    fi
}
start_ssh_agent

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches
###
