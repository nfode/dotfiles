# vim: fdm=marker
setopt NO_HUP
setopt NO_CHECK_JOBS
alias evince="GTK_THEME=Breath-Dark evince"
alias spec="evince /home/nfode/Nextcloud/uni/5.Semester/stupro/TOSCA-Simple-Profile-YAML-v1.1-cos01.pdf &> /dev/null &"
bindkey -v
export PATH=$PATH:$HOME/.local/bin
export TERM="xterm-256color"
#yarn
export PATH=$PATH:$HOME/.node/bin

export PATH=$PATH:/usr/local/go/bin

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/ndk-bundle


# export texlive path
export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux
export VISUAL=nvim
export EDITOR="$VISUAL"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(kubectl git yarn docker mvn sudo history-substring-search)

source $ZSH/oh-my-zsh.sh
# source ~/.config/.private/vpn.zsh
for file in ~/.zshconfig/*; do
    source "$file"
done
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time virtualenv pyenv)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time vi_mode)
export KEYTIMEOUT=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
_fzf_compgen_path() {
    command  fd --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    command fd --type d --follow --exclude ".git" . "$1"
}
#bindkey '\e[A' history-search-backward
#bindkey '\e[B' history-search-forward
# mkdir and cd together {{{
function mkcd {
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}
# }}}	
