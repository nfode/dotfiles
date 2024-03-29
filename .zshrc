# vim: fdm=marker:fdl=0
# setup environment {{{
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export GOPATH=$HOME/go
export GPG_TTY=$(tty)
export ANDROID_HOME=/opt/android-sdk
export VISUAL=nvim
export EDITOR="$VISUAL"
export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color

export FZF_BASE=/usr/share/fzf
# }}}
# setup path {{{
export PATH=$PATH:$HOME/.cargo/env
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.node/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/ndk-bundle
export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux
export PATH=$PATH:/home/nfode/.gem/ruby/2.6.0/bin 

export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
# }}}
# plugin setup {{{
plugins=(archlinux copyfile copyfile copypath rsync git docker history-substring-search colored-man-pages pip helm docker-compose vi-mode zsh-z fzf fzf-tab)
# }}}
# source all the settings {{{
#source /usr/share/sodalite/shell-integration.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/oh-my-zsh.sh
for file in ~/.zshconfig/*; do
    source "$file"
done

[ -f $BWHASH_FILE ] && source $BWHASH_FILE
# }}}
# fzf {{{
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    command fd --type d --follow --exclude ".git" . "$1"
}
# }}}
# misc {{{
setopt NO_HUP
setopt NO_CHECK_JOBS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

export KEYTIMEOUT=1
# }}}
# perl {{{
PATH="/home/nfode/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/nfode/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/nfode/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/nfode/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/nfode/perl5"; export PERL_MM_OPT;
# }}}
# set keys for substring search {{{
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# }}}
# powerlevel10k {{{
flip_context(){
    local prompt=$(which flip-prompt &> /dev/null && flip-prompt)
    echo $prompt
}
POWERLEVEL9K_CUSTOM_FLIP_CONTEXT="flip_context"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status custom_flip_context ssh dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode virtualenv)

POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="002"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="004"
POWERLEVEL9K_VI_MODE_FOREGROUND="000"
# }}}
# asdf {{{
#source /opt/asdf-vm/asdf.sh
#source /opt/asdf-vm/completion/asdf.bash
# }}}
# flip {{{
flipInit=$FLIP/devops/shell-init.sh
[ -f "$flipInit" ] && source "$flipInit"
alias fd=/usr/bin/fd
# }}}
# {{{ thefuck
eval $(thefuck --alias)
# }}}
#  {{{ vi-mode
bindkey -M vicmd 'V' edit-command-line # this remaps `vv` to `V` (but overrides `visual-mode`)
#  }}}
#  {{{ fzf-tab
## disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-a:toggle-all'
#  }}}

alias discord='discord --no-sandbox'
source <(stern --completion=zsh)

source <(k6 completion zsh)

