
prev="[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"
export FZF_DEFAULT_COMMAND='find *'
export FZF_DEFAULT_OPTS='+x --border --height 100% --preview "'$prev'" --preview-window right:50%:wrap'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

