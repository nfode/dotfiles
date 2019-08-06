# aliases
alias k="kubectl"
alias t='todo.sh'

alias enw="emacs -nw"

alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias boot="vim $HOME/.yadm/bootstrap"

alias evince="GTK_THEME=Arc-Dark evince"

alias :q=exit

alias weather="curl wttr.in/Stuttgart"

# if exa is installed, use it instead of ls
if command -v exa > /dev/null; then
    alias ll='exa --classify -l --git --group-directories-first --time-style=long-iso'
    alias ls='exa'
else
    alias ll='ls -FAggoT 12 --human-readable --group-directories-first --time-style=long-iso --color=auto'
    alias ls='ls --almost-all --color=auto --format=across'
fi

# don't accidentally delete/overwrite files
# don't correct spelling mistakes
alias rm='rm -i'
alias cp='nocorrect cp'
alias mv='nocorrect mv -i'
alias touch='nocorrect touch'
alias mkdir='nocorrect mkdir'

# nice colours for grep
alias grep='grep --color=auto --exclude-dir=.git'

# use hl as cat with syntax highlighting
alias hl='highlight -O ansi --failsafe'

# use vless as less with syntax highlighting
lesssh=$(find /usr/share/nvim -name 'less.sh' | head -1)
if [ -r "${lesssh}" ]; then
    alias vless="${lesssh}"
fi
unset lesssh

# miscellaneous
alias zshconfig='nvim ~/.zshrc'
alias tetris='autoload -U tetriscurses; tetriscurses'

alias ya="yadm add"
alias yaa="yadm add --all"
alias yau="yadm add -u"
alias yc="yadm commit -v"
alias yd="yadm diff"
alias yf="yadm fetch"
alias yyl="yadm pull origin $(current_branch)"
alias yl="yadm pull"
alias yp="yadm push"
alias yss="yadm status -s"
alias ys="yadm status"
