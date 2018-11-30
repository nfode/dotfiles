if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CONFIG_DIR=$XDG_CONFIG_HOME

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
  export _JAVA_AWT_WM_NONREPARENTING=1
  export GDK_BACKEND=x11
  export CLUTTER_BACKEND=wayland
  export QT_QPA_PLATFORM=wayland-egl
  export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
  XKB_DEFAULT_LAYOUT=us exec sway &> log.txt
  source ~/.xprofile
  fi
