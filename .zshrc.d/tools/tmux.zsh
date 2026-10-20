alias ta="tmux attach"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias tat="tmux attach -t"
alias tl="tmux -L"

_tmux_session_name(){
    local name
    if [ -z "$1" ]; then
        name=$(basename "$PWD")
        if [[ "${name:0:1}" == "." ]]; then
            name=${name:1}
        fi
    else
        name="$1"
    fi
    name=${name//[.:]/_}
    echo "$name"
}

tn(){
    SESSION_NAME=$(_tmux_session_name "$1")
    tmux new -d -s "$SESSION_NAME"
    tmux new-window -t "$SESSION_NAME":2 -n "nvim"
    tmux new-window -t "$SESSION_NAME":3 -n "git"
    tmux new-window -t "$SESSION_NAME":4 -n "server"
    tmux select-window -t "$SESSION_NAME":1
    tmux attach -t "$SESSION_NAME"
}

t(){
    SESSION_NAME=$(_tmux_session_name "$1")
    tmux new -A -s "$SESSION_NAME"
}
