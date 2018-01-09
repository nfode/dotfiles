# start keyring daemon {{{
# fix seahorse: enable "add keyring"
# start keyring daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
# }}}
exec i3
