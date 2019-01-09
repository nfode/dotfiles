if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx &> /dev/null
    clear
    exit
fi

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 2 ]; then
    export _JAVA_AWT_WM_NONREPARENTING=1
    export GDK_BACKEND=wayland
    export CLUTTER_BACKEND=wayland
    export QT_QPA_PLATFORM=wayland-egl
    export QT_WAYLAND_FORCE_DPI=physical
    export SDL_VIDEODRIVER=wayland
    export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
    XKB_DEFAULT_LAYOUT=us exec sway &> log.txt
    source ~/.xprofile
fi
