if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export QT_QPA_PLATFORMTHEME="qt5ct"
export PATH="$HOME/.local/bin:$PATH"
export TERM=xterm-256color
export TERMINAL=termite
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx &> /dev/null
    clear
   exit
fi
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 2 ]; then
  XKB_DEFAULT_LAYOUT=de exec sway &> log.txt
fi

export PATH="$HOME/.cargo/bin:$PATH"
