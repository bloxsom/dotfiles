# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

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

# Skip forward/back a word with opt-arrow
bindkey -v

alias gt="godep go test \$(go list ./... | grep -v /vendor/)"
alias gtc="godep go test -covermode=count \$(go list ./... | grep -v /vendor/)"
function gth() {
  godep go test -covermode=count -coverprofile=count.out ./$1 && godep go tool cover -html=count.out
}

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "frmendes/geometry", as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "hlissner/zsh-autopair", defer:2
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
HISTSIZE=1000
SAVEHIST=1000
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
