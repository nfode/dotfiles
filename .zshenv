export PATH="$HOME/.local/bin:$PATH"
export BIN="$HOME/bin"
export PATH="$BIN:$PATH"

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CONFIG_DIR=$XDG_CONFIG_HOME

export QT_QPA_PLATFORMTHEME="qt5ct"

export TERM=xterm-256color
export TERMINAL=alacritty

export BWHASH_FILE=$HOME/.bwhash

export SUDO_ASKPASS=/usr/lib/ssh/x11-ssh-askpass
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export FLIP=$HOME/dev/work/flip

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
