fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

export FZF_DEFAULT_COMMAND='find *'
export FZF_DEFAULT_OPTS='+x --border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
