center_prompt_on_empty_enter() {
    if [[ -z $BUFFER ]]; then
        local half=$(( LINES / 2 ))

        for ((i=0; i<half; i++)); do echo; done
        print -n "\e[${half}A"
        zle reset-prompt
    else
        zle accept-line
    fi
}

zle -N center_prompt_on_empty_enter
bindkey '^M' center_prompt_on_empty_enter

