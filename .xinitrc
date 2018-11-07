# start keyring daemon {{{
# fix seahorse: enable "add keyring"
# start keyring daemon
setxkbmap -option caps:escape -option compose:ralt
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
# }}}
exec i3
