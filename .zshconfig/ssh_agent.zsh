# Run ssh agent
# If you come from bash you might have to change your $PATH.
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)">/dev/null
    ssh-add 2> /dev/null
fi
