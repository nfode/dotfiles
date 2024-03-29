if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx &> /dev/null
    clear
    exit
fi

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 2 ]; then
    export XDG_SESSION_TYPE=wayland
    export _JAVA_AWT_WM_NONREPARENTING=1
    export GDK_BACKEND=wayland
    export QT_QPA_PLATFORM=wayland-egl
    export CLUTTER_BACKEND=wayland
    export SDL_VIDEODRIVER=wayland
    export EWOL_BACKEND=wayland
    #export QT_WAYLAND_FORCE_DPI=physical
    export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    source ~/.xprofile
    XKB_DEFAULT_LAYOUT=us exec sway &> log.txt
fi


# Added by Toolbox App
export PATH="$PATH:/home/nfode/.local/share/JetBrains/Toolbox/scripts"