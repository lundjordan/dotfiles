# autoload -U colors
# colors
# setopt prompt_subst
# if [ $VIRTUAL_ENV ]
# then
#     PROMPT='($(basename "$VIRTUAL_ENV"))%{$fg_bold[black]%}❲%m❳→ %n: %~ %{$fg[cyan]%}$(vcprompt)%{$fg_bold[black]%}
# ⋗  %{$reset_color%}'
#     alias vpip='$VIRTUAL_ENV/bin/pip'
# 
# else
#     PROMPT='%{$fg_bold[black]%}❲%m❳→ %n: %~ %{$fg[cyan]%}$(vcprompt)%{$fg_bold[black]%}
# ⋗  %{$reset_color%}'
# 
# fi
# Prompt format
# PROMPT='
# %{$BLACK%}%n@%m%{$WHITE%}:%{$WHITE%}%~%u$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%}
# %{$BLACK%}>%{$RESET_COLOR%} '
# RPROMPT='%{$BLACK%}$(current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}'



# → old prompt symbol

# Set RPROMPT to have info show up on the right, too.

#############################
# Other Options

# setopt PRINT_EXIT_VALUE

# unsetopt correct_all
# 
# setopt extended_glob
# setopt hist_ignore_dups     # ignore duplication command history list
# setopt share_history        # share command history data
# setopt HIST_IGNORE_SPACE
# setopt APPEND_HISTORY # write history only when closing
# setopt EXTENDED_HISTORY # add more info

# Other tabbing options
# setopt NO_AUTO_MENU
# setopt BASH_AUTO_LIST

#############################
# Variables

# Quote pasted URLs
autoload url-quote-magic
zle -N self-insert url-quote-magic

HISTFILE=~/.zsh_history
SAVEHIST=65000
HISTSIZE=65000

REPORTTIME=10 # Show elapsed time if command took more than X seconds
# LISTMAX=0 # ask to complete if top of list would scroll off screen

## case-insensitive (all),partial-word and then substring completion
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

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
