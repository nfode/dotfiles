# aliases
alias vim=nvim
alias vi=nvim
alias :q=exit
# if exa is installed, use it instead of ls
if command -v exa > /dev/null; then
    alias ll='exa --all --classify --long --git --group-directories-first --time-style=long-iso'
    alias ls='exa --classify --across'
else
    alias ll='ls -FAggoT 12 --human-readable --group-directories-first --time-style=long-iso --color=auto'
    alias ls='ls --almost-all --color=auto --format=across'
fi

# don't accidentally delete/overwrite files
# don't correct spelling mistakes
alias rm='rm -i'
alias cp='nocorrect cp -i'
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
