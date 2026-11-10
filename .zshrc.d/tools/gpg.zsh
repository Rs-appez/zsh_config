export GPG_TTY=$(tty)

load_gpgagent() {
    echo "prime" | gpg --clearsign > /dev/null 2>&1 && echo "GPG agent loaded."
}

unload_gpgagent() {
    gpg-connect-agent reloadagent /bye && echo "GPG agent cleared."
}

