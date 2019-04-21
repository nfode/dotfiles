bw() {
  if [[ $1 == "unlock" ]]; then
    . bw-unlock
    return
elif [[ $1 == "lock" ]]; then
    bw-hash-delete
    unset BW_SESSION
    return
  fi
  command bw "$@"
}
