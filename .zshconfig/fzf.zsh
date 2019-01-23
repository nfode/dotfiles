
prev="[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"
export FZF_DEFAULT_COMMAND='find *'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

