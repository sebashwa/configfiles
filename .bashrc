export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag -g ""'
export GPG_TTY=(tty)
export PATH=$HOME/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH
export PS1="::: "

alias ll='ls -lah'
alias fs='du -h -d 1'
alias ..='cd ..'
alias mux='./.tmux-session'
alias gst='git status'
alias gco='git checkout'
alias tma='tmux a'
alias tms='tmux a -t$(tmux list-sessions -F#S | fzf)'

[ -f ~/.codeon.bash ] && source ~/.codeon.bash

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
