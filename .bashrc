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
alias glg='git log --graph --pretty=format:"%C(auto)%h%<(3)%d %s %C(bold blue)(%cr, %an)%Creset" --abbrev-commit --all'
alias gam='git commit --amend'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias tma='tmux a'
alias open='xdg-open'

[ -f ~/.codeon.bash ] && source ~/.codeon.bash
function tms() {
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t$(tmux list-sessions -F#S | fzf)
  else
    tmux attach -t$(tmux list-sessions -F#S | fzf)
  fi
}

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
