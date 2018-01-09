if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
export QT_QPA_PLATFORMTHEME="qt5ct"
PATH="$HOME/.local/bin:$PATH"
export TERM=konsole
export TERMINAL=$TERM
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx &> /dev/null
    clear
   exit
fi
