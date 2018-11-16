# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  alias vim="nvim"
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

alias dc='docker-compose'

alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias gps='git push'
alias gpl='git pull'

alias r='rails'
alias rs='rails s'
alias rc='rails c'
alias rn='rails new'

alias v='vim'

bindkey -e

alias gt="go test ./..."
alias gtc="go test -covermode=count ./..."
function gth() {
  godep go test -covermode=count -coverprofile=count.out ./$1 && godep go tool cover -html=count.out
}

GEOMETRY_PROMPT_PLUGINS=(exec_time hg)
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "frmendes/geometry", as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "hlissner/zsh-autopair", defer:2
zplug "zuxfoucault/colored-man-pages_mod"
zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

export GEOMETRY_PROMPT_PREFIX=""              # prefix prompt with a new line
export CLICOLOR=1

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# Make forward/backward word navigation behave more like bash
export WORDCHARS=''

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source $HOME/.rvm/scripts/rvm
