export EDITOR=nvim
export FZF_DEFAULT_COMMAND='ag -g ""'
export LANG=en_US.UTF-8
export GPG_TTY=(tty)
export PATH=$HOME/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH
export PS1="::: "

alias ll='ls -lah'
alias fs='du -h -d 1'
alias ..='cd ..'
alias ...="cd .. && cd .."
alias mux='./.tmux-session'
alias gco='git checkout'
alias gst='git status'
alias gba='git branch -a'
alias glg='git log --graph --pretty=format:"%C(auto)%h%<(3)%d %s %C(bold blue)(%cr, %an)%Creset" --abbrev-commit --all'
alias gpro="git remote prune origin"
alias gam='git commit --amend'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias tma='tmux a'
alias open='xdg-open'

function tms() {
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t$(tmux list-sessions -F#S | fzf)
  else
    tmux attach -t$(tmux list-sessions -F#S | fzf)
  fi
}

[[ -f ~/.source/.fzf.bash ]] && source ~/.source/.fzf.bash
[[ -f ~/.source/.codeon.bash ]] && source ~/.source/.codeon.bash

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
