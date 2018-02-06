# vim: fdm=marker:fdl=0
# setup path {{{
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.node/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/ndk-bundle
export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux
# }}}
# setup environment {{{
export ANDROID_HOME=$HOME/Android/Sdk
export VISUAL=nvim
export EDITOR="$VISUAL"
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel9k/powerlevel9k"
# }}}
# plugin setup {{{
plugins=(vi-mode zsh-syntax-highlighting kubectl git yarn docker mvn history-substring-search)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode virtualenv pyenv)
# }}}
# source all the settings {{{
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh
hostname=$(hostname)
if [ "$hostname" = "nick-laptop" ]; then
    source ~/.config/.private/vpn.zsh
fi
for file in ~/.zshconfig/*; do
    source "$file"
done
# }}}
# fzf {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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
