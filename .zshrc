# vim: fdm=marker:fdl=0
# setup environment {{{
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export GOPATH=$HOME/go
export GPG_TTY=$(tty)
export ANDROID_HOME=/opt/android-sdk
export VISUAL=nvim
export EDITOR="$VISUAL"
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
TERM=xterm-256color
# }}}
# setup path {{{
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.node/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/ndk-bundle
export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux
export PATH=$PATH:/home/nfode/.gem/ruby/2.5.0/bin 
# }}}
# plugin setup {{{
plugins=(archlinux copydir copyfile rsync vi-mode zsh-syntax-highlighting kubectl git yarn docker mvn history-substring-search)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status ssh dir) 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode vcs virtualenv pyenv)
POWERLEVEL9K_VI_INSERT_MODE_STRING="[INSERT]"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="[NORMAL]"
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{200}%{\x1b[1m%}\uf101%{\x1b[m%}%f "
# }}}
# source all the settings {{{
source /usr/share/sodalite/shell-integration.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh
hostname=$(hostname)
for file in ~/.zshconfig/*; do
    source "$file"
done
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

bindkey -v
export KEYTIMEOUT=1
# }}}
