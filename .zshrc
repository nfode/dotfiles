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
export PATH=$FLIP/bin:$PATH
# }}}
# plugin setup {{{
plugins=(archlinux copydir copyfile rsync vi-mode kubectl git docker history-substring-search colored-man-pages pip helm)
ZSH_THEME="spaceship"
# }}}
# source all the settings {{{
source /usr/share/sodalite/shell-integration.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/z/z.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh
for file in ~/.zshconfig/*; do
    source "$file"
done

[ -f $BWHASH_FILE ] && source $BWHASH_FILE
# }}}
# fzf {{{
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
_fzf_compgen_path() {
    command  fd --follow --exclude ".git" . "$1"
}

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

bindkey -v
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
# spaceship {{{
# disable modules
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_EXEC_TIME_SHOW=false
SPACESHIP_DOCKER_SHOW=false

# configuration
SPACESHIP_EXIT_CODE_SYMBOL=""
SPACESHIP_GIT_PREFIX=""
SPACESHIP_DIR_TRUNC_PREFIX="../"
# }}}
# asdf {{{
source /opt/asdf-vm/asdf.sh
source /opt/asdf-vm/completions/asdf.bash
# }}}
# flip {{{
flipCompletion=$FLIP/devops/cli/completion.zsh
[ -f $flipCompletion ] && source $flipCompletion
# }}}

if [[ $TERM == xterm-256color && ( -z "$TERMINAL_EMULATOR" && $TERMINAL_EMULATOR != "JetBrains-JediTerm" ) ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi



