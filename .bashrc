export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag -g ""'
export GPG_TTY=(tty)
export PS1=" ☺ "

alias ll='ls -lah'
alias fs='du -h -d 1'
alias ..='cd ..'
alias mux='./.tmux-session'
alias gst='git status'
alias gco='git checkout'

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
