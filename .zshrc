# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

#PATH
export PATH=/usr/local/bin:$PATH
export PATH=.bin/:$PATH

# FUNCTIONS

# set iterm tab title
stt () {
  echo -ne "\033]1;$@\007"
}

# ALIASES
alias b="bundle exec"
alias mate="cd ~/code/mate/"
alias tripper="cd ~/code/tripper/"
alias code="cd ~/code/"
alias gst="git status"
alias gd="git diff"
alias gco="git checkout"
alias gba="git branch -a"
alias gpro="git remote prune origin"
alias ..="cd .."
alias ...="cd .. && cd .."
alias vi="nvim"
alias vim="vim"
alias mysql="/usr/local/Cellar/mysql55/5.5.30/bin/mysql"

